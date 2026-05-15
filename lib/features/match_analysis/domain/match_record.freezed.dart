// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchRecord _$MatchRecordFromJson(Map<String, dynamic> json) {
  return _MatchRecord.fromJson(json);
}

/// @nodoc
mixin _$MatchRecord {
  int get id => throw _privateConstructorUsedError;
  MatchStats? get halfTime => throw _privateConstructorUsedError;
  MatchStats? get fullTime => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchRecordCopyWith<MatchRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchRecordCopyWith<$Res> {
  factory $MatchRecordCopyWith(
          MatchRecord value, $Res Function(MatchRecord) then) =
      _$MatchRecordCopyWithImpl<$Res, MatchRecord>;
  @useResult
  $Res call(
      {int id, MatchStats? halfTime, MatchStats? fullTime, DateTime createdAt});

  $MatchStatsCopyWith<$Res>? get halfTime;
  $MatchStatsCopyWith<$Res>? get fullTime;
}

/// @nodoc
class _$MatchRecordCopyWithImpl<$Res, $Val extends MatchRecord>
    implements $MatchRecordCopyWith<$Res> {
  _$MatchRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? halfTime = freezed,
    Object? fullTime = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      halfTime: freezed == halfTime
          ? _value.halfTime
          : halfTime // ignore: cast_nullable_to_non_nullable
              as MatchStats?,
      fullTime: freezed == fullTime
          ? _value.fullTime
          : fullTime // ignore: cast_nullable_to_non_nullable
              as MatchStats?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MatchStatsCopyWith<$Res>? get halfTime {
    if (_value.halfTime == null) {
      return null;
    }

    return $MatchStatsCopyWith<$Res>(_value.halfTime!, (value) {
      return _then(_value.copyWith(halfTime: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MatchStatsCopyWith<$Res>? get fullTime {
    if (_value.fullTime == null) {
      return null;
    }

    return $MatchStatsCopyWith<$Res>(_value.fullTime!, (value) {
      return _then(_value.copyWith(fullTime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MatchRecordImplCopyWith<$Res>
    implements $MatchRecordCopyWith<$Res> {
  factory _$$MatchRecordImplCopyWith(
          _$MatchRecordImpl value, $Res Function(_$MatchRecordImpl) then) =
      __$$MatchRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, MatchStats? halfTime, MatchStats? fullTime, DateTime createdAt});

  @override
  $MatchStatsCopyWith<$Res>? get halfTime;
  @override
  $MatchStatsCopyWith<$Res>? get fullTime;
}

/// @nodoc
class __$$MatchRecordImplCopyWithImpl<$Res>
    extends _$MatchRecordCopyWithImpl<$Res, _$MatchRecordImpl>
    implements _$$MatchRecordImplCopyWith<$Res> {
  __$$MatchRecordImplCopyWithImpl(
      _$MatchRecordImpl _value, $Res Function(_$MatchRecordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? halfTime = freezed,
    Object? fullTime = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$MatchRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      halfTime: freezed == halfTime
          ? _value.halfTime
          : halfTime // ignore: cast_nullable_to_non_nullable
              as MatchStats?,
      fullTime: freezed == fullTime
          ? _value.fullTime
          : fullTime // ignore: cast_nullable_to_non_nullable
              as MatchStats?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchRecordImpl extends _MatchRecord {
  const _$MatchRecordImpl(
      {this.id = Isar.autoIncrement,
      this.halfTime,
      this.fullTime,
      required this.createdAt})
      : super._();

  factory _$MatchRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchRecordImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final MatchStats? halfTime;
  @override
  final MatchStats? fullTime;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'MatchRecord(id: $id, halfTime: $halfTime, fullTime: $fullTime, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.halfTime, halfTime) ||
                other.halfTime == halfTime) &&
            (identical(other.fullTime, fullTime) ||
                other.fullTime == fullTime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, halfTime, fullTime, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchRecordImplCopyWith<_$MatchRecordImpl> get copyWith =>
      __$$MatchRecordImplCopyWithImpl<_$MatchRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchRecordImplToJson(
      this,
    );
  }
}

abstract class _MatchRecord extends MatchRecord {
  const factory _MatchRecord(
      {final int id,
      final MatchStats? halfTime,
      final MatchStats? fullTime,
      required final DateTime createdAt}) = _$MatchRecordImpl;
  const _MatchRecord._() : super._();

  factory _MatchRecord.fromJson(Map<String, dynamic> json) =
      _$MatchRecordImpl.fromJson;

  @override
  int get id;
  @override
  MatchStats? get halfTime;
  @override
  MatchStats? get fullTime;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$MatchRecordImplCopyWith<_$MatchRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
