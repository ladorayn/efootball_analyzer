import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/match_record.dart';
import '../../domain/match_stats.dart';

part 'match_draft_state.freezed.dart';

@freezed
class MatchDraftState with _$MatchDraftState {
  const factory MatchDraftState({
    required MatchRecord record,
    MatchStats? pendingStats,
  }) = _MatchDraftState;
}
