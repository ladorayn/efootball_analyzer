import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/match_stats.dart';
import '../../data/ocr_service.dart';
import '../../application/match_stats_parser.dart';

part 'match_analysis_controller.g.dart';

@riverpod
class MatchAnalysisController extends _$MatchAnalysisController {
  final ImagePicker _picker = ImagePicker();

  @override
  FutureOr<MatchStats?> build() {
    return null; // Initial state is null (no match loaded)
  }

  Future<void> importAndParse() async {
    state = const AsyncLoading();

    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );

      if (picked == null) {
        state = const AsyncData(null); // User cancelled
        return;
      }

      final imageFile = File(picked.path);
      final ocrService = ref.read(ocrServiceProvider);
      
      final ocrResult = await ocrService.recognize(imageFile);
      final parsed = MatchStatsParser.parse(ocrResult.elements);

      if (parsed == null) {
        // If parsing fails, we could throw an exception or set a specific state.
        // For now, let's throw so the UI can catch it in AsyncError.
        throw Exception("Could not parse screenshot. Raw Text:\n${ocrResult.text}");
      }

      state = AsyncData(parsed);

    } catch (e, st) {
      print('ERROR during import: $e');
      state = AsyncError(e, st);
    }
  }

  void selectSide(String side) {
    if (state.value != null) {
      final currentStats = state.value!;
      // Use Freezed copyWith to update the side
      state = AsyncData(currentStats.copyWith(userSide: side));
    }
  }

  void reset() {
    state = const AsyncData(null);
  }
}
