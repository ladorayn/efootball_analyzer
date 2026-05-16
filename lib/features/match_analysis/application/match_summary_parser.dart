import '../data/ocr_service.dart';
import '../domain/match_summary.dart';

class MatchSummaryParser {
  static MatchSummary? parse(List<OcrElement> rawElements) {
    if (rawElements.isEmpty) return null;

    final elements = rawElements.where((e) => e.text.isNotEmpty).toList()
      ..sort((a, b) => a.y.compareTo(b.y));

    OcrElement? dateElement;
    OcrElement? scoreElement;

    String leftUsername = '';
    String rightUsername = '';
    String leftTeamName = '';
    String rightTeamName = '';
    int leftScore = 0;
    int rightScore = 0;
    String matchDate = '';

    for (var e in elements) {
      if (RegExp(r'\d{2}[-/]\d{2}[-/]\d{4}').hasMatch(e.text)) {
        dateElement = e;
        matchDate = e.text;
      } else if (RegExp(r'\d+\s*-\s*\d+').hasMatch(e.text)) {
        scoreElement = e;
        // Parse scores
        final parts = e.text.split('-');
        if (parts.length >= 2) {
          leftScore = int.tryParse(parts[0].trim()) ?? 0;
          rightScore = int.tryParse(parts[1].trim()) ?? 0;
        }
      }
    }

    // Determine the center boundaries based on Date and Score
    double minCenter = 0;
    double maxCenter = 9999;
    
    if (dateElement != null && scoreElement != null) {
      minCenter = [dateElement.x, scoreElement.x].reduce((a, b) => a < b ? a : b) - 50;
      maxCenter = [dateElement.x, scoreElement.x].reduce((a, b) => a > b ? a : b) + 50;
    } else {
      final allX = elements.map((e) => e.x).toList()..sort();
      if (allX.isNotEmpty) {
        final midX = (allX.first + allX.last) / 2;
        minCenter = midX - 100;
        maxCenter = midX + 100;
      }
    }

    // Partition elements
    final leftElements = elements.where((e) => e.x < minCenter).toList()..sort((a, b) => a.y.compareTo(b.y));
    final rightElements = elements.where((e) => e.x > maxCenter).toList()..sort((a, b) => a.y.compareTo(b.y));

    // Filter out potential noise (like elements way too far off to the side)
    // Assuming team name and username are roughly aligned vertically
    if (leftElements.isNotEmpty) {
      leftTeamName = leftElements.first.text;
      leftUsername = leftElements.last.text;
    }

    if (rightElements.isNotEmpty) {
      rightTeamName = rightElements.first.text;
      rightUsername = rightElements.last.text;
    }

    if (leftUsername.isEmpty && rightUsername.isEmpty) return null;

    return MatchSummary(
      leftUsername: leftUsername,
      rightUsername: rightUsername,
      leftTeamName: leftTeamName,
      rightTeamName: rightTeamName,
      leftScore: leftScore,
      rightScore: rightScore,
      matchDate: matchDate,
    );
  }
}
