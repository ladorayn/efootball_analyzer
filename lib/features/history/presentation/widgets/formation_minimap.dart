import 'package:efootball_analyzer/features/match_analysis/domain/team_formation.dart';
import 'package:flutter/material.dart';

class FormationMinimap extends StatelessWidget {
  final TeamFormation formation;

  const FormationMinimap({super.key, required this.formation});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3, // Roughly the aspect ratio of a soccer pitch vertically
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade800,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white24, width: 2),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;

            return Stack(
              children: [
                // Pitch markings (simplified)
                Center(
                  child: Container(
                    width: width,
                    height: 1,
                    color: Colors.white24,
                  ),
                ),
                Center(
                  child: Container(
                    width: width * 0.3,
                    height: width * 0.3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white24),
                    ),
                  ),
                ),
                // Penalty areas
                Positioned(
                  top: 0,
                  left: width * 0.25,
                  child: Container(
                    width: width * 0.5,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white24),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: width * 0.25,
                  child: Container(
                    width: width * 0.5,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white24),
                    ),
                  ),
                ),
                // Players
                ...formation.players.map((p) {
                  // Add padding to ensure dots don't get cut off at the edges
                  const double paddingX = 24.0;
                  const double paddingY = 24.0;
                  final double usableWidth = width - paddingX * 2;
                  final double usableHeight = height - paddingY * 2;

                  return Positioned(
                    left: paddingX + p.x * usableWidth - 15, // center the 30x30 widget
                    top: paddingY + p.y * usableHeight - 15,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            p.position,
                            style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: _getColorForPosition(p.position),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Center(
                            child: Text(
                              p.overall.toString(),
                              style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            );
          },
        ),
      ),
    );
  }

  Color _getColorForPosition(String pos) {
    switch (pos) {
      case 'CF':
      case 'SS':
      case 'LWF':
      case 'RWF':
        return Colors.red.shade700;
      case 'AMF':
      case 'LMF':
      case 'RMF':
      case 'CMF':
        return Colors.orange.shade700;
      case 'DMF':
        return Colors.green.shade600;
      case 'LB':
      case 'RB':
      case 'CB':
        return Colors.blue.shade700;
      case 'GK':
        return Colors.purple.shade600;
      default:
        return Colors.grey.shade700;
    }
  }
}
