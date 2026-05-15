import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../domain/match_record.dart';
import '../../domain/match_stats.dart';
import '../../data/ocr_service.dart';
import '../../application/match_stats_parser.dart';
import 'match_draft_state.dart';

part 'match_analysis_controller.g.dart';

@riverpod
class MatchAnalysisController extends _$MatchAnalysisController {
  final ImagePicker _picker = ImagePicker();

  @override
  FutureOr<MatchDraftState> build() {
    return MatchDraftState(
      record: MatchRecord(createdAt: DateTime.now()),
    );
  }

  Future<void> importAndParse() async {
    final currentState = state.value;
    if (currentState == null) return;

    state = const AsyncLoading();

    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );

      if (picked == null) {
        state = AsyncData(currentState); // User cancelled
        return;
      }

      final imageFile = File(picked.path);
      final ocrService = ref.read(ocrServiceProvider);
      
      final ocrResult = await ocrService.recognize(imageFile);
      final parsed = MatchStatsParser.parse(ocrResult.elements);

      if (parsed == null) {
        throw Exception("Could not parse screenshot. Raw Text:\n${ocrResult.text}");
      }

      // Check for duplicates
      if (parsed.matchStatus == 'Half Time' && currentState.record.halfTime != null) {
        throw Exception("You have already uploaded a Half Time screenshot for this match.");
      }
      if (parsed.matchStatus == 'Full Time' && currentState.record.fullTime != null) {
        throw Exception("You have already uploaded a Full Time screenshot for this match.");
      }

      // Put the parsed stats into pending for user confirmation
      state = AsyncData(currentState.copyWith(pendingStats: parsed));

    } catch (e, st) {
      print('ERROR during import: $e');
      // On error, revert to previous draft state but wrapped in error?
      // Actually, we can throw the error to UI, but we lose the draft if we do `AsyncError(e, st)`.
      // Let's attach the error to the state or use AsyncError with previous data.
      state = AsyncError<MatchDraftState>(e, st).copyWithPrevious(AsyncData(currentState));
    }
  }

  void confirmPendingStats(String userSide) {
    final currentState = state.value;
    if (currentState == null || currentState.pendingStats == null) return;

    final confirmedStats = currentState.pendingStats!.copyWith(userSide: userSide);
    
    MatchRecord updatedRecord = currentState.record;
    if (confirmedStats.matchStatus == 'Half Time') {
      updatedRecord = updatedRecord.copyWith(halfTime: confirmedStats);
    } else if (confirmedStats.matchStatus == 'Full Time') {
      updatedRecord = updatedRecord.copyWith(fullTime: confirmedStats);
    } else {
      // If unknown, we can just save it to Full Time as fallback
      updatedRecord = updatedRecord.copyWith(fullTime: confirmedStats);
    }

    state = AsyncData(MatchDraftState(
      record: updatedRecord,
      pendingStats: null, // Clear pending
    ));
  }

  void cancelPendingStats() {
    final currentState = state.value;
    if (currentState == null) return;
    
    state = AsyncData(currentState.copyWith(pendingStats: null));
  }

  Future<void> saveMatchRecord() async {
    final currentState = state.value;
    if (currentState == null) return;
    
    state = const AsyncLoading();

    try {
      final isar = Isar.getInstance();
      if (isar != null) {
        await isar.writeTxn(() async {
          await isar.matchRecords.put(currentState.record);
        });
      }
      
      // Reset draft
      state = AsyncData(MatchDraftState(
        record: MatchRecord(createdAt: DateTime.now()),
      ));
    } catch (e, st) {
      state = AsyncError<MatchDraftState>(e, st).copyWithPrevious(AsyncData(currentState));
    }
  }

  void resetDraft() {
    state = AsyncData(MatchDraftState(
      record: MatchRecord(createdAt: DateTime.now()),
    ));
  }
}
