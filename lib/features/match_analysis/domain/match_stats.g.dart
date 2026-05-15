// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_stats.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MatchStatsSchema = Schema(
  name: r'MatchStats',
  id: -3260809760795758002,
  properties: {
    r'leftName': PropertySchema(
      id: 0,
      name: r'leftName',
      type: IsarType.string,
    ),
    r'leftScore': PropertySchema(
      id: 1,
      name: r'leftScore',
      type: IsarType.long,
    ),
    r'leftStatsList': PropertySchema(
      id: 2,
      name: r'leftStatsList',
      type: IsarType.stringList,
    ),
    r'matchStatus': PropertySchema(
      id: 3,
      name: r'matchStatus',
      type: IsarType.string,
    ),
    r'rightName': PropertySchema(
      id: 4,
      name: r'rightName',
      type: IsarType.string,
    ),
    r'rightScore': PropertySchema(
      id: 5,
      name: r'rightScore',
      type: IsarType.long,
    ),
    r'rightStatsList': PropertySchema(
      id: 6,
      name: r'rightStatsList',
      type: IsarType.stringList,
    ),
    r'userSide': PropertySchema(
      id: 7,
      name: r'userSide',
      type: IsarType.string,
    )
  },
  estimateSize: _matchStatsEstimateSize,
  serialize: _matchStatsSerialize,
  deserialize: _matchStatsDeserialize,
  deserializeProp: _matchStatsDeserializeProp,
);

int _matchStatsEstimateSize(
  MatchStats object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.leftName.length * 3;
  bytesCount += 3 + object.leftStatsList.length * 3;
  {
    for (var i = 0; i < object.leftStatsList.length; i++) {
      final value = object.leftStatsList[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.matchStatus.length * 3;
  bytesCount += 3 + object.rightName.length * 3;
  bytesCount += 3 + object.rightStatsList.length * 3;
  {
    for (var i = 0; i < object.rightStatsList.length; i++) {
      final value = object.rightStatsList[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.userSide;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _matchStatsSerialize(
  MatchStats object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.leftName);
  writer.writeLong(offsets[1], object.leftScore);
  writer.writeStringList(offsets[2], object.leftStatsList);
  writer.writeString(offsets[3], object.matchStatus);
  writer.writeString(offsets[4], object.rightName);
  writer.writeLong(offsets[5], object.rightScore);
  writer.writeStringList(offsets[6], object.rightStatsList);
  writer.writeString(offsets[7], object.userSide);
}

MatchStats _matchStatsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MatchStats(
    leftName: reader.readStringOrNull(offsets[0]) ?? '',
    leftScore: reader.readLongOrNull(offsets[1]) ?? 0,
    leftStatsList: reader.readStringList(offsets[2]) ?? const [],
    matchStatus: reader.readStringOrNull(offsets[3]) ?? 'Unknown',
    rightName: reader.readStringOrNull(offsets[4]) ?? '',
    rightScore: reader.readLongOrNull(offsets[5]) ?? 0,
    rightStatsList: reader.readStringList(offsets[6]) ?? const [],
    userSide: reader.readStringOrNull(offsets[7]),
  );
  return object;
}

P _matchStatsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readStringList(offset) ?? const []) as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? 'Unknown') as P;
    case 4:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 5:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 6:
      return (reader.readStringList(offset) ?? const []) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MatchStatsQueryFilter
    on QueryBuilder<MatchStats, MatchStats, QFilterCondition> {
  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> leftNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'leftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> leftNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'leftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> leftNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'leftName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'leftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> leftNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'leftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> leftNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'leftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> leftNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'leftName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leftName',
        value: '',
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'leftName',
        value: '',
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> leftScoreEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leftScore',
        value: value,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'leftScore',
        value: value,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> leftScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'leftScore',
        value: value,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> leftScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'leftScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftStatsListElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leftStatsList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftStatsListElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'leftStatsList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftStatsListElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'leftStatsList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftStatsListElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'leftStatsList',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftStatsListElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'leftStatsList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftStatsListElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'leftStatsList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftStatsListElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'leftStatsList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftStatsListElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'leftStatsList',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftStatsListElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leftStatsList',
        value: '',
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftStatsListElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'leftStatsList',
        value: '',
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftStatsListLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'leftStatsList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftStatsListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'leftStatsList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftStatsListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'leftStatsList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftStatsListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'leftStatsList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftStatsListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'leftStatsList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      leftStatsListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'leftStatsList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      matchStatusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      matchStatusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matchStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      matchStatusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matchStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      matchStatusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matchStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      matchStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'matchStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      matchStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'matchStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      matchStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'matchStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      matchStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'matchStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      matchStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      matchStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'matchStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> rightNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rightName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rightName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> rightNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rightName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> rightNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rightName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rightName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> rightNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rightName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> rightNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rightName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> rightNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rightName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rightName',
        value: '',
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rightName',
        value: '',
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> rightScoreEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rightScore',
        value: value,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rightScore',
        value: value,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rightScore',
        value: value,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> rightScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rightScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightStatsListElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rightStatsList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightStatsListElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rightStatsList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightStatsListElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rightStatsList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightStatsListElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rightStatsList',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightStatsListElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rightStatsList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightStatsListElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rightStatsList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightStatsListElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rightStatsList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightStatsListElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rightStatsList',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightStatsListElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rightStatsList',
        value: '',
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightStatsListElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rightStatsList',
        value: '',
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightStatsListLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rightStatsList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightStatsListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rightStatsList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightStatsListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rightStatsList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightStatsListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rightStatsList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightStatsListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rightStatsList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      rightStatsListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rightStatsList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> userSideIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userSide',
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      userSideIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userSide',
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> userSideEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userSide',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      userSideGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userSide',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> userSideLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userSide',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> userSideBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userSide',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      userSideStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userSide',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> userSideEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userSide',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> userSideContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userSide',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> userSideMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userSide',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      userSideIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userSide',
        value: '',
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      userSideIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userSide',
        value: '',
      ));
    });
  }
}

extension MatchStatsQueryObject
    on QueryBuilder<MatchStats, MatchStats, QFilterCondition> {}
