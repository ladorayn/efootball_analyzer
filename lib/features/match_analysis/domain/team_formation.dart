import 'package:isar/isar.dart';

part 'team_formation.g.dart';

@Embedded()
class PlayerPosition {
  double x;
  double y;
  String position;
  int overall;

  PlayerPosition({
    this.x = 0.0,
    this.y = 0.0,
    this.position = '',
    this.overall = 0,
  });
}

@Embedded()
class TeamFormation {
  String pattern;
  String playingStyle;
  List<PlayerPosition> players;

  TeamFormation({
    this.pattern = '',
    this.playingStyle = '',
    this.players = const [],
  });
}
