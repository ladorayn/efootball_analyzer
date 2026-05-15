import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:flutter/material.dart';

part 'match_stats.freezed.dart';
part 'match_stats.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class MatchStats with _$MatchStats {
  const MatchStats._();

  const factory MatchStats({
    @Default(Isar.autoIncrement) int id,
    required String leftName,
    required String rightName,
    required int leftScore,
    required int rightScore,
    required List<String> leftStatsList,
    required List<String> rightStatsList,
    required String matchStatus,
    String? userSide,
    required DateTime createdAt,
  }) = _MatchStats;

  // Isar requires a default constructor for deserialization.
  // We use freezed's fromJson to handle JSON serialization (useful for AI models).
  factory MatchStats.fromJson(Map<String, dynamic> json) => _$MatchStatsFromJson(json);

  Id get isarId => id; // Isar will use this as the primary key

  @ignore
  String get userName => userSide == 'left' ? leftName : rightName;

  @ignore
  String get opponentName => userSide == 'left' ? rightName : leftName;

  @ignore
  int get userScore => userSide == 'left' ? leftScore : rightScore;

  @ignore
  int get opponentScore => userSide == 'left' ? rightScore : leftScore;

  @ignore
  Map<String, String> get userStats => userSide == 'left' ? leftStats : rightStats;

  @ignore
  Map<String, String> get opponentStats => userSide == 'left' ? rightStats : leftStats;

  @ignore
  Map<String, String> get leftStats {
    return {for (final s in leftStatsList) if (s.contains(':')) s.split(':')[0]: s.substring(s.indexOf(':') + 1)};
  }

  @ignore
  Map<String, String> get rightStats {
    return {for (final s in rightStatsList) if (s.contains(':')) s.split(':')[0]: s.substring(s.indexOf(':') + 1)};
  }

  @ignore
  String get result {
    if (userScore > opponentScore) return 'WIN';
    if (userScore < opponentScore) return 'LOSS';
    return 'DRAW';
  }

  @ignore
  Color get resultColor {
    if (result == 'WIN') return const Color(0xFF1D9E75);
    if (result == 'LOSS') return const Color(0xFFE24B4A);
    return const Color(0xFFBA7517);
  }
}
