import 'package:efootball_analyzer/ocr_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(const EFootballAnalyzer());
}

class EFootballAnalyzer extends StatelessWidget {
  const EFootballAnalyzer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eFootball Analyzer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A237E)),
        useMaterial3: true,
      ),
      home: const MatchStatsScreen(),
    );
  }
}

// --- Data Model ---
class MatchStats {
  final String leftName;
  final String rightName;
  final int leftScore;
  final int rightScore;
  final Map<String, String> leftStats;
  final Map<String, String> rightStats;
  String? userSide;

  MatchStats({
    required this.leftName,
    required this.rightName,
    required this.leftScore,
    required this.rightScore,
    required this.leftStats,
    required this.rightStats,
    this.userSide,
  });

  String get userName => userSide == 'left' ? leftName : rightName;
  String get opponentName => userSide == 'left' ? rightName : leftName;
  int get userScore => userSide == 'left' ? leftScore : rightScore;
  int get opponentScore => userSide == 'left' ? rightScore : leftScore;
  Map<String, String> get userStats =>
      userSide == 'left' ? leftStats : rightStats;
  Map<String, String> get opponentStats =>
      userSide == 'left' ? rightStats : leftStats;

  String get result {
    if (userScore > opponentScore) return 'WIN';
    if (userScore < opponentScore) return 'LOSS';
    return 'DRAW';
  }

  Color get resultColor {
    if (result == 'WIN') return const Color(0xFF1D9E75);
    if (result == 'LOSS') return const Color(0xFFE24B4A);
    return const Color(0xFFBA7517);
  }
}

// --- Parser ---
class MatchStatsParser {
  static const List<String> _statLabels = [
    'Possession',
    'Shots',
    'Shots on Target',
    'Fouls',
    'Offsides',
    'Corner Kicks',
    'Free Kicks',
    'Passes',
    'Successful Passes',
    'Crosses',
    'Interceptions',
    'Tackles',
    'Saves',
  ];

  static const List<String> _noise = [
    'FOOTBALL',
    'SFOOTBALL',
    'PLAY CEAXY',
    'Next',
    'Full Time',
    'Half Time',
    'eFootball',
  ];

  static MatchStats? parse(List<OcrElement> rawElements) {
    // Step 1 — filter noise and build working list
    final elements = rawElements
        .where((e) => e.text.isNotEmpty)
        .where((e) => !_noise.any(
              (n) => e.text.toLowerCase().contains(n.toLowerCase()),
            ))
        .toList()
      ..sort((a, b) => a.y.compareTo(b.y));

    if (elements.isEmpty) return null;

    // DEBUG
    for (final el in elements) {
      print('PARSER ELEMENT | x:${el.x.toInt()} y:${el.y.toInt()} | "${el.text}"');
    }

    // Step 2 — determine screen midpoint X
    final allX = elements.map((e) => e.x).toList()..sort();
    final double screenMidX = (allX.first + allX.last) / 2;
    print('MIDPOINT X: ${screenMidX.toInt()}');

    // Find the Y coordinate of the first stat label to define the header zone
    final statLabelElements = elements.where((e) {
      return _statLabels.any((label) => e.text.toLowerCase().contains(label.toLowerCase()));
    }).toList();

    if (statLabelElements.isEmpty) {
      print('NO STAT LABELS FOUND');
      return null;
    }

    final topStatY = statLabelElements.map((e) => e.y).reduce((a, b) => a < b ? a : b);
    print('TOP STAT Y: ${topStatY.toInt()}');

    // Step 3 — parse header line
    // Header elements are those above the top stat label
    final headerElements = elements.where((e) => e.y < topStatY - 10).toList()
      ..sort((a, b) => a.x.compareTo(b.x));

    final leftHeader = headerElements.where((e) => e.x < screenMidX).toList();
    final rightHeader = headerElements.where((e) => e.x > screenMidX).toList();

    final leftText = leftHeader.map((e) => e.text.trim()).join(' ').trim();
    final rightText = rightHeader.map((e) => e.text.trim()).join(' ').trim();

    String leftName = '';
    String rightName = '';
    int leftScore = 0;
    int rightScore = 0;

    final leftMatch = RegExp(r'^(.*?)\s+(\d+)$').firstMatch(leftText);
    if (leftMatch != null) {
      leftName = leftMatch.group(1)!.trim();
      leftScore = int.parse(leftMatch.group(2)!);
    } else {
      leftName = leftText;
    }

    final rightMatch = RegExp(r'^(\d+)\s+(.*?)$').firstMatch(rightText);
    if (rightMatch != null) {
      rightScore = int.parse(rightMatch.group(1)!);
      rightName = rightMatch.group(2)!.trim();
    } else {
      rightName = rightText;
    }

    print('LEFT: "$leftName" $leftScore | RIGHT: "$rightName" $rightScore');

    if (leftName.isEmpty || rightName.isEmpty) {
      print('NAME EMPTY — leftName:"$leftName" rightName:"$rightName"');
      return null;
    }

    // Step 4 — categorize remaining elements
    final leftNumbers = <double, String>{};
    final rightNumbers = <double, String>{};
    final labelPositions = <double, String>{};

    for (final el in elements) {
      // skip header zone
      if (el.y < topStatY - 10) continue;

      // skip names
      if (el.text == leftName ||
          el.text == rightName) continue;

      // check if stat label — exact match preferred, contains as fallback
      final matchedLabel = _statLabels.firstWhere(
        (label) => el.text.toLowerCase() == label.toLowerCase(),
        orElse: () => _statLabels.firstWhere(
          (label) => el.text.toLowerCase().contains(label.toLowerCase()),
          orElse: () => '',
        ),
      );

      if (matchedLabel.isNotEmpty) {
        labelPositions[el.y] = matchedLabel;
        continue;
      }

      // check if number or percentage
      if (RegExp(r'^\d+%?$').hasMatch(el.text)) {
        if (el.x < screenMidX) {
          leftNumbers[el.y] = el.text;
        } else {
          rightNumbers[el.y] = el.text;
        }
      }
    }

    print('LABELS FOUND: ${labelPositions.values.toList()}');
    print('LEFT NUMBERS: $leftNumbers');
    print('RIGHT NUMBERS: $rightNumbers');

    // Step 5 — match labels to closest numbers by Y position
    final leftStats = <String, String>{};
    final rightStats = <String, String>{};

    for (final labelEntry in labelPositions.entries) {
      final labelY = labelEntry.key;
      final label = labelEntry.value;

      final leftMatch = _closestByY(leftNumbers, labelY);
      final rightMatch = _closestByY(rightNumbers, labelY);

      leftStats[label] = leftMatch ?? '-';
      rightStats[label] = rightMatch ?? '-';

      print('STAT "$label" y:${labelY.toInt()} → left:$leftMatch right:$rightMatch');
    }

    return MatchStats(
      leftName: leftName,
      rightName: rightName,
      leftScore: leftScore,
      rightScore: rightScore,
      leftStats: leftStats,
      rightStats: rightStats,
    );
  }

  static String? _closestByY(Map<double, String> numbers, double targetY) {
    if (numbers.isEmpty) return null;

    double? closestY;
    double minDistance = double.infinity;

    for (final y in numbers.keys) {
      final distance = (y - targetY).abs();
      if (distance < minDistance) {
        minDistance = distance;
        closestY = y;
      }
    }

    if (closestY != null && minDistance < 60) {
      return numbers[closestY];
    }
    return null;
  }
}

class _TextElement {
  final String text;
  final double x;
  final double y;

  _TextElement({required this.text, required this.x, required this.y});
}

// --- Main Screen ---
class MatchStatsScreen extends StatefulWidget {
  const MatchStatsScreen({super.key});

  @override
  State<MatchStatsScreen> createState() => _MatchStatsScreenState();
}

class _MatchStatsScreenState extends State<MatchStatsScreen> {
  File? _selectedImage;
  MatchStats? _parsedStats;
  String _rawText = '';
  bool _isProcessing = false;

  final ImagePicker _picker = ImagePicker();

  Future<void> _importAndParse() async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (picked == null) return;

    setState(() {
      _selectedImage = File(picked.path);
      _isProcessing = true;
      _parsedStats = null;
      _rawText = '';
    });

    try {
      final imageFile = File(picked.path);

      // OcrService handles iOS (Vision) vs Android (ML Kit) automatically
      final ocrResult = await OcrService.recognize(imageFile);
      final parsed = MatchStatsParser.parse(ocrResult.elements);

      print('PARSED RESULT: $parsed');
      print('RAW TEXT:\n${ocrResult.text}');

      setState(() {
        _rawText = ocrResult.text;
        _parsedStats = parsed;
        _isProcessing = false;
      });

      if (parsed != null) {
        _showSideSelector(parsed);
      }
    } catch (e) {
      print('ERROR: $e');
      setState(() {
        _isProcessing = false;
        _rawText = 'Error: $e';
      });
    }
  }

  void _showSideSelector(MatchStats stats) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Which side is you?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tap your club/name below',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _SideButton(
                    name: stats.leftName,
                    score: stats.leftScore,
                    onTap: () {
                      Navigator.pop(context);
                      setState(() => stats.userSide = 'left');
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _SideButton(
                    name: stats.rightName,
                    score: stats.rightScore,
                    onTap: () {
                      Navigator.pop(context);
                      setState(() => stats.userSide = 'right');
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    OcrService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D1A),
        title: const Text(
          'eFootball Analyzer',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: _isProcessing ? null : _importAndParse,
              icon: const Icon(Icons.upload_rounded),
              label: const Text('Import Match Screenshot'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A237E),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (_isProcessing)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              )
            else if (_parsedStats != null && _parsedStats!.userSide != null)
              _MatchResultCard(stats: _parsedStats!)
            else if (_rawText.isNotEmpty && _parsedStats == null)
              _ErrorCard(rawText: _rawText),
          ],
        ),
      ),
    );
  }
}

// --- Side Selector Button ---
class _SideButton extends StatelessWidget {
  final String name;
  final int score;
  final VoidCallback onTap;

  const _SideButton({
    required this.name,
    required this.score,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1A237E),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue.shade300),
        ),
        child: Column(
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              score.toString(),
              style: const TextStyle(
                color: Colors.yellow,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Result Card ---
class _MatchResultCard extends StatelessWidget {
  final MatchStats stats;

  const _MatchResultCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A2E),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: stats.resultColor.withOpacity(0.5)),
          ),
          child: Column(
            children: [
              Text(
                stats.result,
                style: TextStyle(
                  color: stats.resultColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      stats.userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '${stats.userScore}  —  ${stats.opponentScore}',
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      stats.opponentName,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A2E),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'You',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Stat',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Opponent',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.white12),
              ...stats.userStats.entries.map((entry) {
                return _StatRow(
                  label: entry.key,
                  userValue: entry.value,
                  opponentValue: stats.opponentStats[entry.key] ?? '-',
                );
              }),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}

// --- Stat Row ---
class _StatRow extends StatelessWidget {
  final String label;
  final String userValue;
  final String opponentValue;

  const _StatRow({
    required this.label,
    required this.userValue,
    required this.opponentValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              userValue,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              opponentValue,
              style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

// --- Error Card ---
class _ErrorCard extends StatelessWidget {
  final String rawText;

  const _ErrorCard({required this.rawText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.shade900),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Could not parse this screenshot',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Make sure you import the match stats screen showing Possession, Shots, and Passes.',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 12),
          const Text(
            'Raw OCR output:',
            style: TextStyle(color: Colors.grey, fontSize: 11),
          ),
          const SizedBox(height: 4),
          SelectableText(
            rawText,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 11,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}