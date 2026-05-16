import 'package:isar/isar.dart';

part 'user_settings.g.dart';

@Collection()
class UserSettings {
  Id id = Isar.autoIncrement;

  String username;

  UserSettings({
    required this.username,
  });
}
