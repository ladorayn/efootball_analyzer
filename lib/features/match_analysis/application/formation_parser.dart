import '../data/ocr_service.dart';
import '../domain/team_formation.dart';

class FormationParser {
  static const validPositions = {
    'CF', 'SS', 'LWF', 'RWF', 'AMF', 'LMF', 'RMF', 'CMF', 'DMF', 'LB', 'RB', 'CB', 'GK'
  };

  static const validStyles = {
    'Possession Game',
    'Quick Counter',
    'Long Ball Counter',
    'Out Wide',
    'Long Ball',
  };

  static TeamFormation parse(List<OcrElement> elements) {
    if (elements.isEmpty) {
      throw Exception("No text detected in the image.");
    }

    String pattern = '';
    String playingStyle = '';
    
    // Find pattern and playing style
    for (var e in elements) {
      // Check pattern
      if (pattern.isEmpty && RegExp(r'^\d(-\d){2,3}$').hasMatch(e.text.trim())) {
        final sum = e.text.split('-').map((s) => int.tryParse(s) ?? 0).reduce((a, b) => a + b);
        if (sum == 10) {
          pattern = e.text.trim();
        }
      }
      // Check style
      if (playingStyle.isEmpty) {
        for (var style in validStyles) {
          if (e.text.toLowerCase().contains(style.toLowerCase())) {
            playingStyle = style;
            break;
          }
        }
      }
    }

    // Find positions
    final positionElements = elements.where((e) => validPositions.contains(e.text.toUpperCase().trim())).toList();
    
    if (positionElements.length != 11) {
      throw Exception("Strict Validation Failed: Detected ${positionElements.length} player positions instead of 11. Ensure no cards overlap and retake the screenshot.");
    }

    List<PlayerPosition> players = [];
    for (var posElement in positionElements) {
      // Find the nearest number below this position
      final candidates = elements.where((e) {
        final isNumber = RegExp(r'^\d+$').hasMatch(e.text.trim());
        final isBelow = e.y > posElement.y && e.y < posElement.y + 70; // typically 30-50 px below
        final isAlignedX = (e.x - posElement.x).abs() < 50;
        return isNumber && isBelow && isAlignedX;
      }).toList();

      if (candidates.isEmpty) {
        throw Exception("Strict Validation Failed: Could not find overall rating for position ${posElement.text}. Ensure no cards overlap.");
      }

      // Sort by closeness in Y
      candidates.sort((a, b) => (a.y - posElement.y).abs().compareTo((b.y - posElement.y).abs()));
      
      final overallStr = candidates.first.text.trim();
      final overall = int.tryParse(overallStr) ?? 0;

      players.add(PlayerPosition(
        x: posElement.x,
        y: posElement.y,
        position: posElement.text.toUpperCase().trim(),
        overall: overall,
      ));
    }

    if (players.length != 11) {
      throw Exception("Strict Validation Failed: Parsed ${players.length} valid players instead of 11.");
    }

    // Normalize coordinates
    double minX = players.map((p) => p.x).reduce((a, b) => a < b ? a : b);
    double maxX = players.map((p) => p.x).reduce((a, b) => a > b ? a : b);
    double minY = players.map((p) => p.y).reduce((a, b) => a < b ? a : b);
    double maxY = players.map((p) => p.y).reduce((a, b) => a > b ? a : b);

    // Provide a small margin so dots don't sit exactly on the edge
    double rangeX = maxX - minX;
    double rangeY = maxY - minY;
    
    if (rangeX == 0) rangeX = 1;
    if (rangeY == 0) rangeY = 1;

    for (var p in players) {
      p.x = (p.x - minX) / rangeX;
      p.y = (p.y - minY) / rangeY;
    }

    return TeamFormation(
      pattern: pattern,
      playingStyle: playingStyle,
      players: players,
    );
  }
}
