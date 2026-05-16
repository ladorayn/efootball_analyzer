import 'package:flutter/material.dart';
import '../../match_analysis/domain/match_record.dart';
import '../../match_analysis/domain/match_stats.dart';
import 'widgets/formation_minimap.dart';

class MatchDetailScreen extends StatelessWidget {
  final MatchRecord record;

  const MatchDetailScreen({super.key, required this.record});

  @override
  Widget build(BuildContext context) {

    print("RECORD ${record.myFormation.toString()}");
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D1A),
        foregroundColor: Colors.white,
        title: const Text('Match Details', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            
            if (record.myFormation != null || record.opponentFormation != null) ...[
              const _SectionHeader(title: 'FORMATIONS'),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: record.myFormation != null
                        ? Column(
                            children: [
                              Text(record.summary?.leftTeamName ?? 'Home', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12), textAlign: TextAlign.center),
                              Text('${record.myFormation!.pattern} • ${record.myFormation!.playingStyle}', style: const TextStyle(color: Colors.white54, fontSize: 10), textAlign: TextAlign.center),
                              const SizedBox(height: 8),
                              FormationMinimap(formation: record.myFormation!),
                            ],
                          )
                        : const Center(child: Text('N/A', style: TextStyle(color: Colors.white54))),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: record.opponentFormation != null
                        ? Column(
                            children: [
                              Text(record.summary?.rightTeamName ?? 'Away', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12), textAlign: TextAlign.center),
                              Text('${record.opponentFormation!.pattern} • ${record.opponentFormation!.playingStyle}', style: const TextStyle(color: Colors.white54, fontSize: 10), textAlign: TextAlign.center),
                              const SizedBox(height: 8),
                              FormationMinimap(formation: record.opponentFormation!),
                            ],
                          )
                        : const Center(child: Text('N/A', style: TextStyle(color: Colors.white54))),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],

            if (record.halfTime != null) ...[
              _SectionHeader(
                title: 'HALF TIME STATS',
                subtitle: '${record.halfTime!.leftName} ${record.halfTime!.leftScore} - ${record.halfTime!.rightScore} ${record.halfTime!.rightName}',
              ),
              const SizedBox(height: 12),
              _StatsComparisonTable(stats: record.halfTime!),
              const SizedBox(height: 32),
            ],
            if (record.fullTime != null) ...[
              _SectionHeader(
                title: 'FULL TIME STATS',
                subtitle: '${record.fullTime!.leftName} ${record.fullTime!.leftScore} - ${record.fullTime!.rightScore} ${record.fullTime!.rightName}',
              ),
              const SizedBox(height: 12),
              _StatsComparisonTable(stats: record.fullTime!),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final stats = record.latestStats;
    if (stats == null) return const SizedBox.shrink();

    final isUserLeft = stats.userSide == 'left';

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: record.resultColor.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            record.result,
            style: TextStyle(color: record.resultColor, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  isUserLeft ? '${stats.leftName} (You)' : stats.leftName,
                  style: TextStyle(color: isUserLeft ? Colors.blueAccent : Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '${stats.leftScore} - ${stats.rightScore}',
                  style: const TextStyle(color: Colors.yellow, fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  !isUserLeft ? '${stats.rightName} (You)' : stats.rightName,
                  style: TextStyle(color: !isUserLeft ? Colors.blueAccent : Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  const _SectionHeader({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 4, height: 16, color: Colors.blueAccent),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.1),
            ),
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              subtitle!,
              style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 11, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ],
    );
  }
}

class _StatsComparisonTable extends StatelessWidget {
  final MatchStats stats;

  const _StatsComparisonTable({required this.stats});

  @override
  Widget build(BuildContext context) {
    // Parse the stats lists
    final Map<String, String> leftMap = {};
    for (var s in stats.leftStatsList) {
      final parts = s.split(':');
      if (parts.length >= 2) leftMap[parts[0]] = parts[1];
    }

    final Map<String, String> rightMap = {};
    for (var s in stats.rightStatsList) {
      final parts = s.split(':');
      if (parts.length >= 2) rightMap[parts[0]] = parts[1];
    }

    // Get all unique keys
    final keys = leftMap.keys.toList();

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: keys.length,
        separatorBuilder: (_, __) => Divider(color: Colors.white.withOpacity(0.05), height: 1),
        itemBuilder: (context, index) {
          final key = keys[index];
          final leftVal = leftMap[key] ?? '-';
          final rightVal = rightMap[key] ?? '-';

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    leftVal,
                    style: TextStyle(
                      color: stats.userSide == 'left' ? Colors.blueAccent : Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    key,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    rightVal,
                    style: TextStyle(
                      color: stats.userSide == 'right' ? Colors.blueAccent : Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
