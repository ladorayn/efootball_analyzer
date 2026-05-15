import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/match_stats.dart';
import 'controllers/match_analysis_controller.dart';

class MatchStatsScreen extends ConsumerWidget {
  const MatchStatsScreen({super.key});

  void _showSideSelector(BuildContext context, WidgetRef ref, MatchStats stats) {
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
                      ref.read(matchAnalysisControllerProvider.notifier).selectSide('left');
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
                      ref.read(matchAnalysisControllerProvider.notifier).selectSide('right');
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
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(matchAnalysisControllerProvider);

    // If data just arrived and userSide is null, show selector
    ref.listen(matchAnalysisControllerProvider, (previous, next) {
      if (next is AsyncData<MatchStats?> && next.value != null && next.value!.userSide == null) {
        _showSideSelector(context, ref, next.value!);
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D1A),
        title: const Text(
          'eFootball Analyzer',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          if (state.value != null)
            IconButton(
              icon: const Icon(Icons.refresh, color: Colors.white),
              onPressed: () => ref.read(matchAnalysisControllerProvider.notifier).reset(),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: state.isLoading 
                  ? null 
                  : () => ref.read(matchAnalysisControllerProvider.notifier).importAndParse(),
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
            state.when(
              data: (stats) {
                if (stats == null) return const SizedBox.shrink();
                if (stats.userSide == null) return const SizedBox.shrink();
                return _MatchResultCard(stats: stats);
              },
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
              error: (err, _) => _ErrorCard(errorText: err.toString()),
            ),
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
            border: Border.all(color: _getResultColor(stats.result).withOpacity(0.5)),
          ),
          child: Column(
            children: [
              Text(
                stats.result,
                style: TextStyle(
                  color: _getResultColor(stats.result),
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

  Color _getResultColor(String result) {
    if (result == 'WIN') return const Color(0xFF1D9E75);
    if (result == 'LOSS') return const Color(0xFFE24B4A);
    return const Color(0xFFBA7517);
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
  final String errorText;

  const _ErrorCard({required this.errorText});

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
          Text(
            errorText,
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
