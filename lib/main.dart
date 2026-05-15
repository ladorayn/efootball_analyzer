import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'features/match_analysis/domain/match_record.dart';
import 'features/core/presentation/main_scaffold.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Isar for local storage
  final dir = await getApplicationDocumentsDirectory();
  await Isar.open(
    [MatchRecordSchema],
    directory: dir.path,
  );

  runApp(
    const ProviderScope(
      child: EFootballAnalyzer(),
    ),
  );
}

class EFootballAnalyzer extends StatelessWidget {
  const EFootballAnalyzer({super.key});

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
      home: const MainScaffold(),
    );
  }
}