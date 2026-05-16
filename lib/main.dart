import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'features/match_analysis/domain/match_record.dart';
import 'features/core/domain/user_settings.dart';
import 'features/core/presentation/main_scaffold.dart';
import 'features/core/presentation/setup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Isar for local storage
  final dir = await getApplicationDocumentsDirectory();
  await Isar.open(
    [MatchRecordSchema, UserSettingsSchema],
    directory: dir.path,
  );

  final isar = Isar.getInstance();
  final settings = await isar?.userSettings.where().findFirst();
  final hasUsername = settings != null && settings.username.isNotEmpty;

  runApp(
    ProviderScope(
      child: EFootballAnalyzer(hasUsername: hasUsername),
    ),
  );
}

class EFootballAnalyzer extends StatelessWidget {
  final bool hasUsername;

  const EFootballAnalyzer({super.key, required this.hasUsername});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eFootball Analyzer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A237E),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: hasUsername ? const MainScaffold() : const SetupScreen(),
    );
  }
}