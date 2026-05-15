// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_draft_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MatchDraftState {
  MatchRecord get record => throw _privateConstructorUsedError;
  MatchStats? get pendingStats => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MatchDraftStateCopyWith<MatchDraftState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchDraftStateCopyWith<$Res> {
  factory $MatchDraftStateCopyWith(
          MatchDraftState value, $Res Function(MatchDraftState) then) =
      _$MatchDraftStateCopyWithImpl<$Res, MatchDraftState>;
  @useResult
  $Res call({MatchRecord record, MatchStats? pendingStats});
}

/// @nodoc
class _$MatchDraftStateCopyWithImpl<$Res, $Val extends MatchDraftState>
    implements $MatchDraftStateCopyWith<$Res> {
  _$MatchDraftStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
    Object? pendingStats = freezed,
  }) {
    return _then(_value.copyWith(
      record: null == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as MatchRecord,
      pendingStats: freezed == pendingStats
          ? _value.pendingStats
          : pendingStats // ignore: cast_nullable_to_non_nullable
              as MatchStats?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchDraftStateImplCopyWith<$Res>
    implements $MatchDraftStateCopyWith<$Res> {
  factory _$$MatchDraftStateImplCopyWith(_$MatchDraftStateImpl value,
          $Res Function(_$MatchDraftStateImpl) then) =
      __$$MatchDraftStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MatchRecord record, MatchStats? pendingStats});
}

/// @nodoc
class __$$MatchDraftStateImplCopyWithImpl<$Res>
    extends _$MatchDraftStateCopyWithImpl<$Res, _$MatchDraftStateImpl>
    implements _$$MatchDraftStateImplCopyWith<$Res> {
  __$$MatchDraftStateImplCopyWithImpl(
      _$MatchDraftStateImpl _value, $Res Function(_$MatchDraftStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
    Object? pendingStats = freezed,
  }) {
    return _then(_$MatchDraftStateImpl(
      record: null == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as MatchRecord,
      pendingStats: freezed == pendingStats
          ? _value.pendingStats
          : pendingStats // ignore: cast_nullable_to_non_nullable
              as MatchStats?,
    ));
  }
}

/// @nodoc

class _$MatchDraftStateImpl implements _MatchDraftState {
  const _$MatchDraftStateImpl({required this.record, this.pendingStats});

  @override
  final MatchRecord record;
  @override
  final MatchStats? pendingStats;

  @override
  String toString() {
    return 'MatchDraftState(record: $record, pendingStats: $pendingStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchDraftStateImpl &&
            (identical(other.record, record) || other.record == record) &&
            (identical(other.pendingStats, pendingStats) ||
                other.pendingStats == pendingStats));
  }

  @override
  int get hashCode => Object.hash(runtimeType, record, pendingStats);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchDraftStateImplCopyWith<_$MatchDraftStateImpl> get copyWith =>
      __$$MatchDraftStateImplCopyWithImpl<_$MatchDraftStateImpl>(
          this, _$identity);
}

abstract class _MatchDraftState implements MatchDraftState {
  const factory _MatchDraftState(
      {required final MatchRecord record,
      final MatchStats? pendingStats}) = _$MatchDraftStateImpl;

  @override
  MatchRecord get record;
  @override
  MatchStats? get pendingStats;
  @override
  @JsonKey(ignore: true)
  _$$MatchDraftStateImplCopyWith<_$MatchDraftStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
