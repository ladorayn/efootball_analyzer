import '../domain/match_stats.dart';
import '../data/ocr_service.dart';

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
    final leftStatsList = <String>[];
    final rightStatsList = <String>[];

    for (final labelEntry in labelPositions.entries) {
      final labelY = labelEntry.key;
      final label = labelEntry.value;

      final leftMatch = _closestByY(leftNumbers, labelY);
      final rightMatch = _closestByY(rightNumbers, labelY);

      // If one side has a value and other is null,
      // default null to '0' for zero-common stats
      const zeroCommonStats = [
        'Offsides', 'Fouls', 'Corner Kicks',
        'Free Kicks', 'Crosses', 'Tackles', 'Saves'
      ];

      String leftVal = leftMatch ?? '-';
      String rightVal = rightMatch ?? '-';

      // If one side read successfully and other is null on a zero-common stat,
      // assume the missing one is 0
      if (zeroCommonStats.contains(label)) {
        if (leftMatch != null && rightMatch == null) rightVal = '0';
        if (rightMatch != null && leftMatch == null) leftVal = '0';
      }

      leftStatsList.add('$label:$leftVal');
      rightStatsList.add('$label:$rightVal');

      print('STAT "$label" y:${labelY.toInt()} → left:$leftVal right:$rightVal');
    }

    return MatchStats(
      leftName: leftName,
      rightName: rightName,
      leftScore: leftScore,
      rightScore: rightScore,
      leftStatsList: leftStatsList,
      rightStatsList: rightStatsList,
      createdAt: DateTime.now(),
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
