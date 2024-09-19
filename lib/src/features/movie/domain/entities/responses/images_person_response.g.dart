// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_person_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImagesPersonResponseImpl _$$ImagesPersonResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ImagesPersonResponseImpl(
      id: (json['id'] as num).toInt(),
      profiles: (json['profiles'] as List<dynamic>)
          .map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ImagesPersonResponseImplToJson(
        _$ImagesPersonResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profiles': instance.profiles,
    };

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      aspectRatio: (json['aspect_ratio'] as num).toDouble(),
      height: (json['height'] as num).toInt(),
      iso6391: json['iso_639_1'] as String?,
      filePath: json['file_path'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
      width: (json['width'] as num).toInt(),
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'aspect_ratio': instance.aspectRatio,
      'height': instance.height,
      'iso_639_1': instance.iso6391,
      'file_path': instance.filePath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'width': instance.width,
    };
