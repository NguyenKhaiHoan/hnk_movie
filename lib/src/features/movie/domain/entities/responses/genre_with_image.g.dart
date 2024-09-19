// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_with_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenreWithImageImpl _$$GenreWithImageImplFromJson(Map<String, dynamic> json) =>
    _$GenreWithImageImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$GenreWithImageImplToJson(
        _$GenreWithImageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
