import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:efootball_analyzer/features/match_analysis/domain/match_record.dart';
import 'package:efootball_analyzer/features/history/presentation/controllers/history_controller.dart';
import 'match_detail_screen.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(historyControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D1A),
        title: const Text('Match History', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever, color: Colors.redAccent),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: const Color(0xFF1A1A2E),
                  title: const Text('Reset All History?', style: TextStyle(color: Colors.white)),
                  content: const Text('This will delete all saved match records. This cannot be undone.', style: TextStyle(color: Colors.white70)),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ref.read(historyControllerProvider.notifier).clearAll();
                      },
                      child: const Text('Delete All', style: TextStyle(color: Colors.redAccent)),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: state.when(
        data: (records) {
          if (records.isEmpty) {
            return const Center(
              child: Text(
                'No match records found.\nStart by analyzing a match!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async => ref.read(historyControllerProvider.notifier).refresh(),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: records.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final record = records[index];
                return _HistoryCard(
                  record: record,
                  onDelete: () => ref.read(historyControllerProvider.notifier).deleteRecord(record.id),
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator(color: Colors.white)),
        error: (err, _) => Center(child: Text('Error loading history: $err', style: const TextStyle(color: Colors.red))),
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final MatchRecord record;
  final VoidCallback onDelete;

  const _HistoryCard({required this.record, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy - HH:mm');

    return Dismissible(
      key: Key('record_${record.id ?? DateTime.now().millisecondsSinceEpoch}'),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.red.shade900,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => onDelete(),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MatchDetailScreen(record: record)),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A2E),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: record.resultColor.withOpacity(0.5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    record.result,
                    style: TextStyle(color: record.resultColor, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.2),
                  ),
                  Row(
                    children: [
                      Text(
                        dateFormat.format(record.createdAt),
                        style: const TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: const Color(0xFF1A1A2E),
                              title: const Text('Delete Match?', style: TextStyle(color: Colors.white)),
                              content: const Text('Are you sure you want to delete this record?', style: TextStyle(color: Colors.white70)),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    onDelete();
                                  },
                                  child: const Text('Delete', style: TextStyle(color: Colors.redAccent)),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Icon(Icons.delete_outline, color: Colors.grey, size: 18),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      record.userName,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '${record.userScore} - ${record.opponentScore}',
                      style: const TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      record.opponentName,
                      style: TextStyle(color: Colors.grey.shade300, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _StatusBadge(label: 'HT', isPresent: record.halfTime != null),
                  const SizedBox(width: 8),
                  _StatusBadge(label: 'FT', isPresent: record.fullTime != null),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String label;
  final bool isPresent;

  const _StatusBadge({required this.label, required this.isPresent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: isPresent ? Colors.green.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: isPresent ? Colors.green : Colors.grey.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isPresent ? Colors.green : Colors.grey,
          fontSize: 9,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
