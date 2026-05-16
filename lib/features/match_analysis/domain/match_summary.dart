import 'package:isar/isar.dart';

part 'match_summary.g.dart';

@Embedded()
class MatchSummary {
  String leftUsername;
  String rightUsername;
  String leftTeamName;
  String rightTeamName;
  int leftScore;
  int rightScore;
  String? matchDate;

  MatchSummary({
    this.leftUsername = '',
    this.rightUsername = '',
    this.leftTeamName = '',
    this.rightTeamName = '',
    this.leftScore = 0,
    this.rightScore = 0,
    this.matchDate,
  });

  MatchSummary copyWith({
    String? leftUsername,
    String? rightUsername,
    String? leftTeamName,
    String? rightTeamName,
    int? leftScore,
    int? rightScore,
    String? matchDate,
  }) {
    return MatchSummary(
      leftUsername: leftUsername ?? this.leftUsername,
      rightUsername: rightUsername ?? this.rightUsername,
      leftTeamName: leftTeamName ?? this.leftTeamName,
      rightTeamName: rightTeamName ?? this.rightTeamName,
      leftScore: leftScore ?? this.leftScore,
      rightScore: rightScore ?? this.rightScore,
      matchDate: matchDate ?? this.matchDate,
    );
  }
}
