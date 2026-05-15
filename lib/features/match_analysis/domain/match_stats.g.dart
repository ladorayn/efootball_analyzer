// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_stats.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMatchStatsCollection on Isar {
  IsarCollection<MatchStats> get matchStats => this.collection();
}

const MatchStatsSchema = CollectionSchema(
  name: r'MatchStats',
  id: -3260809760795758002,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.long,
    ),
    r'leftName': PropertySchema(
      id: 2,
      name: r'leftName',
      type: IsarType.string,
    ),
    r'leftScore': PropertySchema(
      id: 3,
      name: r'leftScore',
      type: IsarType.long,
    ),
    r'leftStatsList': PropertySchema(
      id: 4,
      name: r'leftStatsList',
      type: IsarType.stringList,
    ),
    r'rightName': PropertySchema(
      id: 5,
      name: r'rightName',
      type: IsarType.string,
    ),
    r'rightScore': PropertySchema(
      id: 6,
      name: r'rightScore',
      type: IsarType.long,
    ),
    r'rightStatsList': PropertySchema(
      id: 7,
      name: r'rightStatsList',
      type: IsarType.stringList,
    ),
    r'userSide': PropertySchema(
      id: 8,
      name: r'userSide',
      type: IsarType.string,
    )
  },
  estimateSize: _matchStatsEstimateSize,
  serialize: _matchStatsSerialize,
  deserialize: _matchStatsDeserialize,
  deserializeProp: _matchStatsDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _matchStatsGetId,
  getLinks: _matchStatsGetLinks,
  attach: _matchStatsAttach,
  version: '3.1.0+1',
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
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeLong(offsets[1], object.id);
  writer.writeString(offsets[2], object.leftName);
  writer.writeLong(offsets[3], object.leftScore);
  writer.writeStringList(offsets[4], object.leftStatsList);
  writer.writeString(offsets[5], object.rightName);
  writer.writeLong(offsets[6], object.rightScore);
  writer.writeStringList(offsets[7], object.rightStatsList);
  writer.writeString(offsets[8], object.userSide);
}

MatchStats _matchStatsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MatchStats(
    createdAt: reader.readDateTime(offsets[0]),
    id: reader.readLong(offsets[1]),
    leftName: reader.readString(offsets[2]),
    leftScore: reader.readLong(offsets[3]),
    leftStatsList: reader.readStringList(offsets[4]) ?? [],
    rightName: reader.readString(offsets[5]),
    rightScore: reader.readLong(offsets[6]),
    rightStatsList: reader.readStringList(offsets[7]) ?? [],
    userSide: reader.readStringOrNull(offsets[8]),
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
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _matchStatsGetId(MatchStats object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _matchStatsGetLinks(MatchStats object) {
  return [];
}

void _matchStatsAttach(IsarCollection<dynamic> col, Id id, MatchStats object) {}

extension MatchStatsQueryWhereSort
    on QueryBuilder<MatchStats, MatchStats, QWhere> {
  QueryBuilder<MatchStats, MatchStats, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MatchStatsQueryWhere
    on QueryBuilder<MatchStats, MatchStats, QWhereClause> {
  QueryBuilder<MatchStats, MatchStats, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MatchStatsQueryFilter
    on QueryBuilder<MatchStats, MatchStats, QFilterCondition> {
  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> idEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

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

extension MatchStatsQueryLinks
    on QueryBuilder<MatchStats, MatchStats, QFilterCondition> {}

extension MatchStatsQuerySortBy
    on QueryBuilder<MatchStats, MatchStats, QSortBy> {
  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> sortByLeftName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leftName', Sort.asc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> sortByLeftNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leftName', Sort.desc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> sortByLeftScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leftScore', Sort.asc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> sortByLeftScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leftScore', Sort.desc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> sortByRightName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rightName', Sort.asc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> sortByRightNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rightName', Sort.desc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> sortByRightScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rightScore', Sort.asc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> sortByRightScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rightScore', Sort.desc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> sortByUserSide() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userSide', Sort.asc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> sortByUserSideDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userSide', Sort.desc);
    });
  }
}

extension MatchStatsQuerySortThenBy
    on QueryBuilder<MatchStats, MatchStats, QSortThenBy> {
  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> thenByLeftName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leftName', Sort.asc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> thenByLeftNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leftName', Sort.desc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> thenByLeftScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leftScore', Sort.asc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> thenByLeftScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leftScore', Sort.desc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> thenByRightName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rightName', Sort.asc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> thenByRightNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rightName', Sort.desc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> thenByRightScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rightScore', Sort.asc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> thenByRightScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rightScore', Sort.desc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> thenByUserSide() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userSide', Sort.asc);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QAfterSortBy> thenByUserSideDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userSide', Sort.desc);
    });
  }
}

extension MatchStatsQueryWhereDistinct
    on QueryBuilder<MatchStats, MatchStats, QDistinct> {
  QueryBuilder<MatchStats, MatchStats, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MatchStats, MatchStats, QDistinct> distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<MatchStats, MatchStats, QDistinct> distinctByLeftName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'leftName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QDistinct> distinctByLeftScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'leftScore');
    });
  }

  QueryBuilder<MatchStats, MatchStats, QDistinct> distinctByLeftStatsList() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'leftStatsList');
    });
  }

  QueryBuilder<MatchStats, MatchStats, QDistinct> distinctByRightName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rightName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MatchStats, MatchStats, QDistinct> distinctByRightScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rightScore');
    });
  }

  QueryBuilder<MatchStats, MatchStats, QDistinct> distinctByRightStatsList() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rightStatsList');
    });
  }

  QueryBuilder<MatchStats, MatchStats, QDistinct> distinctByUserSide(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userSide', caseSensitive: caseSensitive);
    });
  }
}

extension MatchStatsQueryProperty
    on QueryBuilder<MatchStats, MatchStats, QQueryProperty> {
  QueryBuilder<MatchStats, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<MatchStats, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MatchStats, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MatchStats, String, QQueryOperations> leftNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'leftName');
    });
  }

  QueryBuilder<MatchStats, int, QQueryOperations> leftScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'leftScore');
    });
  }

  QueryBuilder<MatchStats, List<String>, QQueryOperations>
      leftStatsListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'leftStatsList');
    });
  }

  QueryBuilder<MatchStats, String, QQueryOperations> rightNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rightName');
    });
  }

  QueryBuilder<MatchStats, int, QQueryOperations> rightScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rightScore');
    });
  }

  QueryBuilder<MatchStats, List<String>, QQueryOperations>
      rightStatsListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rightStatsList');
    });
  }

  QueryBuilder<MatchStats, String?, QQueryOperations> userSideProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userSide');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchStatsImpl _$$MatchStatsImplFromJson(Map<String, dynamic> json) =>
    _$MatchStatsImpl(
      id: (json['id'] as num?)?.toInt() ?? Isar.autoIncrement,
      leftName: json['leftName'] as String,
      rightName: json['rightName'] as String,
      leftScore: (json['leftScore'] as num).toInt(),
      rightScore: (json['rightScore'] as num).toInt(),
      leftStatsList: (json['leftStatsList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      rightStatsList: (json['rightStatsList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userSide: json['userSide'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MatchStatsImplToJson(_$MatchStatsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'leftName': instance.leftName,
      'rightName': instance.rightName,
      'leftScore': instance.leftScore,
      'rightScore': instance.rightScore,
      'leftStatsList': instance.leftStatsList,
      'rightStatsList': instance.rightStatsList,
      'userSide': instance.userSide,
      'createdAt': instance.createdAt.toIso8601String(),
    };
