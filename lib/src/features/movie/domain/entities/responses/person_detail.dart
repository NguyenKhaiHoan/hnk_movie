// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_detail.freezed.dart';
part 'person_detail.g.dart';

@freezed
class PersonDetail with _$PersonDetail {
  const factory PersonDetail({
    required bool adult,
    @JsonKey(name: 'also_known_as') required List<String> alsoKnownAs,
    required String biography,
    required String birthday,
    String? deathday,
    required int gender,
    String? homepage,
    required int id,
    @JsonKey(name: 'imdb_id') required String imdbId,
    @JsonKey(name: 'known_for_department') required String knownForDepartment,
    required String name,
    @JsonKey(name: 'place_of_birth') required String placeOfBirth,
    required double popularity,
    @JsonKey(name: 'profile_path') required String profilePath,
  }) = _PersonDetail;

  factory PersonDetail.fromJson(Map<String, dynamic> json) =>
      _$PersonDetailFromJson(json);
}
