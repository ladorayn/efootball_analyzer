import 'package:isar/isar.dart';
import 'package:flutter/material.dart';
import 'match_stats.dart';

part 'match_record.g.dart';

@Collection()
class MatchRecord {
  Id id = Isar.autoIncrement;

  @Index()
  DateTime createdAt;

  MatchStats? halfTime;
  MatchStats? fullTime;

  MatchRecord({
    required this.createdAt,
    this.halfTime,
    this.fullTime,
    this.id = Isar.autoIncrement,
  });

  MatchRecord copyWith({
    MatchStats? halfTime,
    MatchStats? fullTime,
    DateTime? createdAt,
    Id? id,
  }) {
    final record = MatchRecord(
      halfTime: halfTime ?? this.halfTime,
      fullTime: fullTime ?? this.fullTime,
      createdAt: createdAt ?? this.createdAt,
    );
    record.id = id ?? this.id;
    return record;
  }

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