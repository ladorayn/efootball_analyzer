import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar/isar.dart';
import 'package:efootball_analyzer/features/match_analysis/domain/match_record.dart';

part 'history_controller.g.dart';

@riverpod
class HistoryController extends _$HistoryController {
  @override
  FutureOr<List<MatchRecord>> build() async {
    return _fetchRecords();
  }

  Future<List<MatchRecord>> _fetchRecords() async {
    final isar = Isar.getInstance();
    if (isar == null) return [];

    final check = await isar.matchRecords.where().sortByCreatedAtDesc().findFirst();

    if (check != null) {
      print("RECORDD CHECKK ID ${check.id}");
      print("RECORDD CHECKK FULL TIME SCORE ${check.fullTime?.leftScore} - ${check.fullTime?.rightScore}");
      print("RECORDD CHECKK HT SCORE ${check.halfTime?.leftScore} - ${check.halfTime?.rightScore}");
    }

    return await isar.matchRecords.where().sortByCreatedAtDesc().findAll();
  }

  Future<void> deleteRecord(int id) async {
    print("DELETE RECORD BROO ${id}");
    final isar = Isar.getInstance();
    if (isar == null) return;

    await isar.writeTxn(() async {
      await isar.matchRecords.delete(id);
    });

    // Refresh state
    state = AsyncData(await _fetchRecords());
  }

  Future<void> clearAll() async {
    final isar = Isar.getInstance();
    if (isar == null) return;

    await isar.writeTxn(() async {
      await isar.matchRecords.clear();
    });

    // Refresh state
    state = const AsyncData([]);
  }

  void refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _fetchRecords());
  }
}
