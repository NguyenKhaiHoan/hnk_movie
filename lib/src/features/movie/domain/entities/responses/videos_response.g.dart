// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideosResponseImpl _$$VideosResponseImplFromJson(Map<String, dynamic> json) =>
    _$VideosResponseImpl(
      id: (json['id'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VideosResponseImplToJson(
        _$VideosResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };
