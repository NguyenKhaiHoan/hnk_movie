// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreditResponseImpl _$$CreditResponseImplFromJson(Map<String, dynamic> json) =>
    _$CreditResponseImpl(
      id: (json['id'] as num).toInt(),
      cast: (json['cast'] as List<dynamic>)
          .map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreditResponseImplToJson(
        _$CreditResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
