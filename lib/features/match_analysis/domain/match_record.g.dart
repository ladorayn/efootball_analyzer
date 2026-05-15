// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMatchRecordCollection on Isar {
  IsarCollection<MatchRecord> get matchRecords => this.collection();
}

const MatchRecordSchema = CollectionSchema(
  name: r'MatchRecord',
  id: -3321931835933376304,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'fullTime': PropertySchema(
      id: 1,
      name: r'fullTime',
      type: IsarType.object,
      target: r'MatchStats',
    ),
    r'halfTime': PropertySchema(
      id: 2,
      name: r'halfTime',
      type: IsarType.object,
      target: r'MatchStats',
    )
  },
  estimateSize: _matchRecordEstimateSize,
  serialize: _matchRecordSerialize,
  deserialize: _matchRecordDeserialize,
  deserializeProp: _matchRecordDeserializeProp,
  idName: r'id',
  indexes: {
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'MatchStats': MatchStatsSchema},
  getId: _matchRecordGetId,
  getLinks: _matchRecordGetLinks,
  attach: _matchRecordAttach,
  version: '3.1.0+1',
);

int _matchRecordEstimateSize(
  MatchRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.fullTime;
    if (value != null) {
      bytesCount += 3 +
          MatchStatsSchema.estimateSize(
              value, allOffsets[MatchStats]!, allOffsets);
    }
  }
  {
    final value = object.halfTime;
    if (value != null) {
      bytesCount += 3 +
          MatchStatsSchema.estimateSize(
              value, allOffsets[MatchStats]!, allOffsets);
    }
  }
  return bytesCount;
}

void _matchRecordSerialize(
  MatchRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeObject<MatchStats>(
    offsets[1],
    allOffsets,
    MatchStatsSchema.serialize,
    object.fullTime,
  );
  writer.writeObject<MatchStats>(
    offsets[2],
    allOffsets,
    MatchStatsSchema.serialize,
    object.halfTime,
  );
}

MatchRecord _matchRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MatchRecord(
    createdAt: reader.readDateTime(offsets[0]),
    fullTime: reader.readObjectOrNull<MatchStats>(
      offsets[1],
      MatchStatsSchema.deserialize,
      allOffsets,
    ),
    halfTime: reader.readObjectOrNull<MatchStats>(
      offsets[2],
      MatchStatsSchema.deserialize,
      allOffsets,
    ),
    id: id,
  );
  return object;
}

P _matchRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<MatchStats>(
        offset,
        MatchStatsSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectOrNull<MatchStats>(
        offset,
        MatchStatsSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _matchRecordGetId(MatchRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _matchRecordGetLinks(MatchRecord object) {
  return [];
}

void _matchRecordAttach(
    IsarCollection<dynamic> col, Id id, MatchRecord object) {
  object.id = id;
}

extension MatchRecordQueryWhereSort
    on QueryBuilder<MatchRecord, MatchRecord, QWhere> {
  QueryBuilder<MatchRecord, MatchRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension MatchRecordQueryWhere
    on QueryBuilder<MatchRecord, MatchRecord, QWhereClause> {
  QueryBuilder<MatchRecord, MatchRecord, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterWhereClause> createdAtEqualTo(
      DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterWhereClause> createdAtNotEqualTo(
      DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterWhereClause>
      createdAtGreaterThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterWhereClause> createdAtLessThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterWhereClause> createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MatchRecordQueryFilter
    on QueryBuilder<MatchRecord, MatchRecord, QFilterCondition> {
  QueryBuilder<MatchRecord, MatchRecord, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterFilterCondition>
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

  QueryBuilder<MatchRecord, MatchRecord, QAfterFilterCondition>
      createdAtLessThan(
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

  QueryBuilder<MatchRecord, MatchRecord, QAfterFilterCondition>
      createdAtBetween(
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

  QueryBuilder<MatchRecord, MatchRecord, QAfterFilterCondition>
      fullTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fullTime',
      ));
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterFilterCondition>
      fullTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fullTime',
      ));
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterFilterCondition>
      halfTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'halfTime',
      ));
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterFilterCondition>
      halfTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'halfTime',
      ));
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterFilterCondition> idGreaterThan(
    Id value, {
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

  QueryBuilder<MatchRecord, MatchRecord, QAfterFilterCondition> idLessThan(
    Id value, {
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

  QueryBuilder<MatchRecord, MatchRecord, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
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
}

extension MatchRecordQueryObject
    on QueryBuilder<MatchRecord, MatchRecord, QFilterCondition> {
  QueryBuilder<MatchRecord, MatchRecord, QAfterFilterCondition> fullTime(
      FilterQuery<MatchStats> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'fullTime');
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterFilterCondition> halfTime(
      FilterQuery<MatchStats> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'halfTime');
    });
  }
}

extension MatchRecordQueryLinks
    on QueryBuilder<MatchRecord, MatchRecord, QFilterCondition> {}

extension MatchRecordQuerySortBy
    on QueryBuilder<MatchRecord, MatchRecord, QSortBy> {
  QueryBuilder<MatchRecord, MatchRecord, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }
}

extension MatchRecordQuerySortThenBy
    on QueryBuilder<MatchRecord, MatchRecord, QSortThenBy> {
  QueryBuilder<MatchRecord, MatchRecord, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MatchRecord, MatchRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension MatchRecordQueryWhereDistinct
    on QueryBuilder<MatchRecord, MatchRecord, QDistinct> {
  QueryBuilder<MatchRecord, MatchRecord, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }
}

extension MatchRecordQueryProperty
    on QueryBuilder<MatchRecord, MatchRecord, QQueryProperty> {
  QueryBuilder<MatchRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MatchRecord, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MatchRecord, MatchStats?, QQueryOperations> fullTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullTime');
    });
  }

  QueryBuilder<MatchRecord, MatchStats?, QQueryOperations> halfTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'halfTime');
    });
  }
}
