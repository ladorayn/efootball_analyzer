import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:flutter/material.dart';
import 'match_stats.dart';

part 'match_record.freezed.dart';
part 'match_record.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class MatchRecord with _$MatchRecord {
  const MatchRecord._();

  const factory MatchRecord({
    @Default(Isar.autoIncrement) int id,
    MatchStats? halfTime,
    MatchStats? fullTime,
    required DateTime createdAt,
  }) = _MatchRecord;

  factory MatchRecord.fromJson(Map<String, dynamic> json) => _$MatchRecordFromJson(json);

  Id get isarId => id; // Isar will use this as the primary key

  @ignore
  bool get isComplete => halfTime != null && fullTime != null;

  @ignore
  MatchStats? get latestStats => fullTime ?? halfTime;

  @ignore
  String get userName => latestStats?.userName ?? 'Unknown';

  @ignore
  String get opponentName => latestStats?.opponentName ?? 'Unknown';

  @ignore
  int get userScore => latestStats?.userScore ?? 0;

  @ignore
  int get opponentScore => latestStats?.opponentScore ?? 0;

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
