import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:efootball_analyzer/features/match_analysis/domain/match_stats.dart';
import 'package:efootball_analyzer/features/match_analysis/domain/match_record.dart';
import 'package:efootball_analyzer/features/match_analysis/presentation/controllers/match_analysis_controller.dart';
import 'package:efootball_analyzer/features/match_analysis/presentation/controllers/match_draft_state.dart';

class MatchStatsScreen extends ConsumerWidget {
  const MatchStatsScreen({super.key});

  void _showPendingConfirmation(BuildContext context, WidgetRef ref, MatchStats stats) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1A1A2E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Confirm OCR Data',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                    ref.read(matchAnalysisControllerProvider.notifier).cancelPendingStats();
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Detected Status: ${stats.matchStatus}',
              style: const TextStyle(fontSize: 14, color: Colors.yellow),
            ),
            const SizedBox(height: 16),
            const Text(
              'Which side is your team?',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _SideButton(
                    name: stats.leftName,
                    score: stats.leftScore,
                    onTap: () {
                      Navigator.pop(context);
                      ref.read(matchAnalysisControllerProvider.notifier).confirmPendingStats('left');
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
                      ref.read(matchAnalysisControllerProvider.notifier).confirmPendingStats('right');
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(matchAnalysisControllerProvider);

    // Listen for errors
    ref.listen(matchAnalysisControllerProvider, (previous, next) {
      if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    next.error.toString().replaceAll('Exception: ', ''),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            backgroundColor: const Color(0xFFD32F2F),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(16),
            duration: const Duration(seconds: 4),
          ),
        );
      }
    });

    // Listen for pending stats to show confirmation dialog
    ref.listen<AsyncValue<MatchDraftState>>(matchAnalysisControllerProvider, (previous, next) {
      final pending = next.value?.pendingStats;
      if (pending != null && (previous?.value?.pendingStats == null)) {
        // Post frame callback to ensure build phase completes before showing dialog
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _showPendingConfirmation(context, ref, pending);
        });
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D1A),
        title: const Text(
          'New Match Record',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            onPressed: () => ref.read(matchAnalysisControllerProvider.notifier).resetDraft(),
          ),
        ],
      ),
      body: state.when(
        data: (draft) => _buildBody(context, ref, draft),
        loading: () => const Center(child: CircularProgressIndicator(color: Colors.white)),
        error: (err, _) => _buildBody(context, ref, state.valueOrNull), // fallback to previous state on error
      ),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, MatchDraftState? draft) {
    if (draft == null) return const SizedBox.shrink();
    
    final record = draft.record;
    final isComplete = record.halfTime != null || record.fullTime != null;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Action Buttons
          ElevatedButton.icon(
            onPressed: () => ref.read(matchAnalysisControllerProvider.notifier).importAndParse(),
            icon: const Icon(Icons.add_a_photo),
            label: const Text('Add Match Screenshot (HT / FT)'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A237E),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          
          const SizedBox(height: 24),
          const Text(
            'Draft Record',
            style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // Half Time Slot
          _DraftSlot(
            title: 'Half Time Stats',
            stats: record.halfTime,
            icon: Icons.timelapse,
          ),
          const SizedBox(height: 12),
          
          // Full Time Slot
          _DraftSlot(
            title: 'Full Time Stats',
            stats: record.fullTime,
            icon: Icons.sports_soccer,
          ),

          const SizedBox(height: 32),

          // Save Button
          if (isComplete)
            ElevatedButton(
              onPressed: () {
                ref.read(matchAnalysisControllerProvider.notifier).saveMatchRecord();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Row(
                      children: [
                        Icon(Icons.check_circle_outline, color: Colors.white),
                        SizedBox(width: 12),
                        Text('Match saved to history!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    backgroundColor: Colors.green.shade700,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(16),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Save Match Record', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
        ],
      ),
    );
  }
}

class _DraftSlot extends StatelessWidget {
  final String title;
  final MatchStats? stats;
  final IconData icon;

  const _DraftSlot({required this.title, required this.stats, required this.icon});

  @override
  Widget build(BuildContext context) {
    if (stats == null) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white12, style: BorderStyle.solid),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey),
            const SizedBox(width: 16),
            Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
            const Spacer(),
            const Text('Pending', style: TextStyle(color: Colors.orange, fontSize: 12)),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade800),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.green),
              const SizedBox(width: 12),
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              const Spacer(),
              const Icon(Icons.check_circle, color: Colors.green, size: 20),
            ],
          ),
          const Divider(color: Colors.white12, height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${stats!.userName} (You)', style: const TextStyle(color: Colors.blueAccent)),
              Text('${stats!.userScore} - ${stats!.opponentScore}', style: const TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 18)),
              Text(stats!.opponentName, style: const TextStyle(color: Colors.redAccent)),
            ],
          ),
        ],
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
