// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchStats _$MatchStatsFromJson(Map<String, dynamic> json) {
  return _MatchStats.fromJson(json);
}

/// @nodoc
mixin _$MatchStats {
  String get leftName => throw _privateConstructorUsedError;
  String get rightName => throw _privateConstructorUsedError;
  int get leftScore => throw _privateConstructorUsedError;
  int get rightScore => throw _privateConstructorUsedError;
  List<String> get leftStatsList => throw _privateConstructorUsedError;
  List<String> get rightStatsList => throw _privateConstructorUsedError;
  String get matchStatus => throw _privateConstructorUsedError;
  String? get userSide => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchStatsCopyWith<MatchStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchStatsCopyWith<$Res> {
  factory $MatchStatsCopyWith(
          MatchStats value, $Res Function(MatchStats) then) =
      _$MatchStatsCopyWithImpl<$Res, MatchStats>;
  @useResult
  $Res call(
      {String leftName,
      String rightName,
      int leftScore,
      int rightScore,
      List<String> leftStatsList,
      List<String> rightStatsList,
      String matchStatus,
      String? userSide});
}

/// @nodoc
class _$MatchStatsCopyWithImpl<$Res, $Val extends MatchStats>
    implements $MatchStatsCopyWith<$Res> {
  _$MatchStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leftName = null,
    Object? rightName = null,
    Object? leftScore = null,
    Object? rightScore = null,
    Object? leftStatsList = null,
    Object? rightStatsList = null,
    Object? matchStatus = null,
    Object? userSide = freezed,
  }) {
    return _then(_value.copyWith(
      leftName: null == leftName
          ? _value.leftName
          : leftName // ignore: cast_nullable_to_non_nullable
              as String,
      rightName: null == rightName
          ? _value.rightName
          : rightName // ignore: cast_nullable_to_non_nullable
              as String,
      leftScore: null == leftScore
          ? _value.leftScore
          : leftScore // ignore: cast_nullable_to_non_nullable
              as int,
      rightScore: null == rightScore
          ? _value.rightScore
          : rightScore // ignore: cast_nullable_to_non_nullable
              as int,
      leftStatsList: null == leftStatsList
          ? _value.leftStatsList
          : leftStatsList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rightStatsList: null == rightStatsList
          ? _value.rightStatsList
          : rightStatsList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      matchStatus: null == matchStatus
          ? _value.matchStatus
          : matchStatus // ignore: cast_nullable_to_non_nullable
              as String,
      userSide: freezed == userSide
          ? _value.userSide
          : userSide // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchStatsImplCopyWith<$Res>
    implements $MatchStatsCopyWith<$Res> {
  factory _$$MatchStatsImplCopyWith(
          _$MatchStatsImpl value, $Res Function(_$MatchStatsImpl) then) =
      __$$MatchStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String leftName,
      String rightName,
      int leftScore,
      int rightScore,
      List<String> leftStatsList,
      List<String> rightStatsList,
      String matchStatus,
      String? userSide});
}

/// @nodoc
class __$$MatchStatsImplCopyWithImpl<$Res>
    extends _$MatchStatsCopyWithImpl<$Res, _$MatchStatsImpl>
    implements _$$MatchStatsImplCopyWith<$Res> {
  __$$MatchStatsImplCopyWithImpl(
      _$MatchStatsImpl _value, $Res Function(_$MatchStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leftName = null,
    Object? rightName = null,
    Object? leftScore = null,
    Object? rightScore = null,
    Object? leftStatsList = null,
    Object? rightStatsList = null,
    Object? matchStatus = null,
    Object? userSide = freezed,
  }) {
    return _then(_$MatchStatsImpl(
      leftName: null == leftName
          ? _value.leftName
          : leftName // ignore: cast_nullable_to_non_nullable
              as String,
      rightName: null == rightName
          ? _value.rightName
          : rightName // ignore: cast_nullable_to_non_nullable
              as String,
      leftScore: null == leftScore
          ? _value.leftScore
          : leftScore // ignore: cast_nullable_to_non_nullable
              as int,
      rightScore: null == rightScore
          ? _value.rightScore
          : rightScore // ignore: cast_nullable_to_non_nullable
              as int,
      leftStatsList: null == leftStatsList
          ? _value._leftStatsList
          : leftStatsList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rightStatsList: null == rightStatsList
          ? _value._rightStatsList
          : rightStatsList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      matchStatus: null == matchStatus
          ? _value.matchStatus
          : matchStatus // ignore: cast_nullable_to_non_nullable
              as String,
      userSide: freezed == userSide
          ? _value.userSide
          : userSide // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchStatsImpl extends _MatchStats {
  const _$MatchStatsImpl(
      {this.leftName = '',
      this.rightName = '',
      this.leftScore = 0,
      this.rightScore = 0,
      final List<String> leftStatsList = const [],
      final List<String> rightStatsList = const [],
      this.matchStatus = 'Unknown',
      this.userSide})
      : _leftStatsList = leftStatsList,
        _rightStatsList = rightStatsList,
        super._();

  factory _$MatchStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchStatsImplFromJson(json);

  @override
  @JsonKey()
  final String leftName;
  @override
  @JsonKey()
  final String rightName;
  @override
  @JsonKey()
  final int leftScore;
  @override
  @JsonKey()
  final int rightScore;
  final List<String> _leftStatsList;
  @override
  @JsonKey()
  List<String> get leftStatsList {
    if (_leftStatsList is EqualUnmodifiableListView) return _leftStatsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_leftStatsList);
  }

  final List<String> _rightStatsList;
  @override
  @JsonKey()
  List<String> get rightStatsList {
    if (_rightStatsList is EqualUnmodifiableListView) return _rightStatsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rightStatsList);
  }

  @override
  @JsonKey()
  final String matchStatus;
  @override
  final String? userSide;

  @override
  String toString() {
    return 'MatchStats(leftName: $leftName, rightName: $rightName, leftScore: $leftScore, rightScore: $rightScore, leftStatsList: $leftStatsList, rightStatsList: $rightStatsList, matchStatus: $matchStatus, userSide: $userSide)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchStatsImpl &&
            (identical(other.leftName, leftName) ||
                other.leftName == leftName) &&
            (identical(other.rightName, rightName) ||
                other.rightName == rightName) &&
            (identical(other.leftScore, leftScore) ||
                other.leftScore == leftScore) &&
            (identical(other.rightScore, rightScore) ||
                other.rightScore == rightScore) &&
            const DeepCollectionEquality()
                .equals(other._leftStatsList, _leftStatsList) &&
            const DeepCollectionEquality()
                .equals(other._rightStatsList, _rightStatsList) &&
            (identical(other.matchStatus, matchStatus) ||
                other.matchStatus == matchStatus) &&
            (identical(other.userSide, userSide) ||
                other.userSide == userSide));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      leftName,
      rightName,
      leftScore,
      rightScore,
      const DeepCollectionEquality().hash(_leftStatsList),
      const DeepCollectionEquality().hash(_rightStatsList),
      matchStatus,
      userSide);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchStatsImplCopyWith<_$MatchStatsImpl> get copyWith =>
      __$$MatchStatsImplCopyWithImpl<_$MatchStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchStatsImplToJson(
      this,
    );
  }
}

abstract class _MatchStats extends MatchStats {
  const factory _MatchStats(
      {final String leftName,
      final String rightName,
      final int leftScore,
      final int rightScore,
      final List<String> leftStatsList,
      final List<String> rightStatsList,
      final String matchStatus,
      final String? userSide}) = _$MatchStatsImpl;
  const _MatchStats._() : super._();

  factory _MatchStats.fromJson(Map<String, dynamic> json) =
      _$MatchStatsImpl.fromJson;

  @override
  String get leftName;
  @override
  String get rightName;
  @override
  int get leftScore;
  @override
  int get rightScore;
  @override
  List<String> get leftStatsList;
  @override
  List<String> get rightStatsList;
  @override
  String get matchStatus;
  @override
  String? get userSide;
  @override
  @JsonKey(ignore: true)
  _$$MatchStatsImplCopyWith<_$MatchStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
