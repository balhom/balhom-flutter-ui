// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationEntityImpl _$$PaginationEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationEntityImpl(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: json['results'] as List<dynamic>,
    );

Map<String, dynamic> _$$PaginationEntityImplToJson(
        _$PaginationEntityImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
