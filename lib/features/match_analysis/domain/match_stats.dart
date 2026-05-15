import 'package:isar/isar.dart';
import 'package:flutter/material.dart';

part 'match_stats.g.dart';

@Embedded()
class MatchStats {
  String leftName;
  String rightName;
  int leftScore;
  int rightScore;
  List<String> leftStatsList;
  List<String> rightStatsList;
  String matchStatus;
  String? userSide;

  MatchStats({
    this.leftName = '',
    this.rightName = '',
    this.leftScore = 0,
    this.rightScore = 0,
    this.leftStatsList = const [],
    this.rightStatsList = const [],
    this.matchStatus = 'Unknown',
    this.userSide,
  });

  MatchStats copyWith({
    String? leftName,
    String? rightName,
    int? leftScore,
    int? rightScore,
    List<String>? leftStatsList,
    List<String>? rightStatsList,
    String? matchStatus,
    String? userSide,
  }) {
    return MatchStats(
      leftName: leftName ?? this.leftName,
      rightName: rightName ?? this.rightName,
      leftScore: leftScore ?? this.leftScore,
      rightScore: rightScore ?? this.rightScore,
      leftStatsList: leftStatsList ?? this.leftStatsList,
      rightStatsList: rightStatsList ?? this.rightStatsList,
      matchStatus: matchStatus ?? this.matchStatus,
      userSide: userSide ?? this.userSide,
    );
  }

  @ignore
  String get userName => userSide == 'left' ? leftName : rightName;

  @ignore
  String get opponentName => userSide == 'left' ? rightName : leftName;

  @ignore
  int get userScore => userSide == 'left' ? leftScore : rightScore;

  @ignore
  int get opponentScore => userSide == 'left' ? rightScore : leftScore;

  @ignore
  Map<String, String> get leftStats {
    return {
      for (final s in leftStatsList)
        if (s.contains(':')) s.split(':')[0]: s.substring(s.indexOf(':') + 1)
    };
  }

  @ignore
  Map<String, String> get rightStats {
    return {
      for (final s in rightStatsList)
        if (s.contains(':')) s.split(':')[0]: s.substring(s.indexOf(':') + 1)
    };
  }

  @ignore
  Map<String, String> get userStats =>
      userSide == 'left' ? leftStats : rightStats;

  @ignore
  Map<String, String> get opponentStats =>
      userSide == 'left' ? rightStats : leftStats;

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