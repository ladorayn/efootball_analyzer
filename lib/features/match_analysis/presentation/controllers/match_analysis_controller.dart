import 'dart:io';
import 'package:efootball_analyzer/features/core/domain/user_settings.dart';
import 'package:efootball_analyzer/features/history/presentation/controllers/history_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar/isar.dart';
import '../../domain/match_record.dart';
import '../../data/ocr_service.dart';
import '../../application/match_stats_parser.dart';
import '../../application/match_summary_parser.dart';
import '../../application/formation_parser.dart';
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

  Future<void> importSummary() async {
    final currentState = state.value;
    if (currentState == null) return;

    state = const AsyncLoading();

    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );

      if (picked == null) {
        state = AsyncData(currentState);
        return;
      }

      final imageFile = File(picked.path);
      final ocrService = ref.read(ocrServiceProvider);
      
      final ocrResult = await ocrService.recognize(imageFile);
      final parsedSummary = MatchSummaryParser.parse(ocrResult.elements);

      if (parsedSummary == null) {
        throw Exception("Could not extract Match Summary. Please ensure it's a clear screenshot of the final summary screen.");
      }

      MatchRecord updatedRecord = currentState.record.copyWith(summary: parsedSummary);
      state = AsyncData(MatchDraftState(record: updatedRecord));

    } catch (e, st) {
      state = AsyncError<MatchDraftState>(e, st).copyWithPrevious(AsyncData(currentState));
    }
  }

  Future<void> importFormation(bool isMyFormation) async {
    final currentState = state.value;
    if (currentState == null) return;

    state = const AsyncLoading();

    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );

      if (picked == null) {
        state = AsyncData(currentState);
        return;
      }

      final imageFile = File(picked.path);
      final ocrService = ref.read(ocrServiceProvider);
      
      final ocrResult = await ocrService.recognize(imageFile);
      final parsedFormation = FormationParser.parse(ocrResult.elements);

      MatchRecord updatedRecord = currentState.record;
      if (isMyFormation) {
        updatedRecord = updatedRecord.copyWith(myFormation: parsedFormation);
      } else {
        updatedRecord = updatedRecord.copyWith(opponentFormation: parsedFormation);
      }
      state = AsyncData(MatchDraftState(record: updatedRecord, pendingStats: currentState.pendingStats));

    } catch (e, st) {
      state = AsyncError<MatchDraftState>(e, st).copyWithPrevious(AsyncData(currentState));
    }
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
        throw Exception("Could not extract match statistics. Please make sure the image is clear and contains Half Time or Full Time stats.");
      }

      final summary = currentState.record.summary;
      if (summary == null) {
        throw Exception("Please upload the Match Summary screenshot first.");
      }

      if (parsed.matchStatus == 'Half Time' && currentState.record.halfTime != null) {
        throw Exception("You have already uploaded a Half Time screenshot for this match.");
      }
      if (parsed.matchStatus == 'Full Time' && currentState.record.fullTime != null) {
        throw Exception("You have already uploaded a Full Time screenshot for this match.");
      }

      if (!((parsed.leftName == summary.leftTeamName && parsed.rightName == summary.rightTeamName) ||
            (parsed.leftName == summary.rightTeamName && parsed.rightName == summary.leftTeamName))) {
        throw Exception("Match mismatch: The team names in this screenshot do not match the Match Summary.");
      }

      String? detectedSide;
      final isar = Isar.getInstance();
      if (isar != null) {
        final settings = await isar.userSettings.where().findFirst();
        if (settings != null) {
          final myUsername = settings.username;
          String myTeamName = '';
          if (summary.leftUsername == myUsername) {
            myTeamName = summary.leftTeamName;
          } else if (summary.rightUsername == myUsername) {
            myTeamName = summary.rightTeamName;
          }
          
          if (myTeamName.isNotEmpty) {
            if (parsed.leftName == myTeamName) detectedSide = 'left';
            else if (parsed.rightName == myTeamName) detectedSide = 'right';
          }
        }
      }

      if (detectedSide != null) {
        final confirmedStats = parsed.copyWith(userSide: detectedSide);
        MatchRecord updatedRecord = currentState.record;
        if (confirmedStats.matchStatus == 'Half Time') {
          updatedRecord = updatedRecord.copyWith(halfTime: confirmedStats);
        } else {
          updatedRecord = updatedRecord.copyWith(fullTime: confirmedStats);
        }
        state = AsyncData(MatchDraftState(
          record: updatedRecord,
          pendingStats: null,
        ));
        return;
      }

      state = AsyncData(currentState.copyWith(pendingStats: parsed));

    } catch (e, st) {
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

  Future<bool> saveMatchRecord() async {
    final currentState = state.value;
    if (currentState == null) return false;
    
    state = const AsyncLoading();

    try {
      final record = currentState.record;
      
      // Validation: Check if HT and FT match if both are present
      if (record.halfTime != null && record.fullTime != null) {
        final ht = record.halfTime!;
        final ft = record.fullTime!;
        
        if (ht.leftName != ft.leftName || ht.rightName != ft.rightName) {
          throw Exception("Match mismatch: Team names in Half Time and Full Time screenshots do not match.");
        }
        
        if (ht.userName != ft.userName) {
          throw Exception("Side mismatch: You selected different teams as yours in Half Time vs Full Time.");
        }
      }

      final isar = Isar.getInstance();
      if (isar != null) {
        await isar.writeTxn(() async {
          await isar.matchRecords.put(currentState.record);
        });
      }
      
      // Refresh history screen
      ref.read(historyControllerProvider.notifier).refresh();

      // Reset draft
      state = AsyncData(MatchDraftState(
        record: MatchRecord(createdAt: DateTime.now()),
      ));
      return true;
    } catch (e, st) {
      state = AsyncError<MatchDraftState>(e, st).copyWithPrevious(AsyncData(currentState));
      return false;
    }
  }

  void resetDraft() {
    state = AsyncData(MatchDraftState(
      record: MatchRecord(createdAt: DateTime.now()),
    ));
  }

  void toggleSide(String status) {
    final currentState = state.value;
    if (currentState == null) return;

    MatchRecord record = currentState.record;
    if (status == 'Half Time' && record.halfTime != null) {
      final newSide = record.halfTime!.userSide == 'left' ? 'right' : 'left';
      record = record.copyWith(halfTime: record.halfTime!.copyWith(userSide: newSide));
    } else if (status == 'Full Time' && record.fullTime != null) {
      final newSide = record.fullTime!.userSide == 'left' ? 'right' : 'left';
      record = record.copyWith(fullTime: record.fullTime!.copyWith(userSide: newSide));
    }

    state = AsyncData(currentState.copyWith(record: record));
  }
}
