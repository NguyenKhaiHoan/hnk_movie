// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'images_person_response.freezed.dart';
part 'images_person_response.g.dart';

@freezed
class ImagesPersonResponse with _$ImagesPersonResponse {
  const factory ImagesPersonResponse({
    required int id,
    required List<Profile> profiles,
  }) = _ImagesPersonResponse;

  factory ImagesPersonResponse.fromJson(Map<String, dynamic> json) =>
      _$ImagesPersonResponseFromJson(json);
}

@freezed
class Profile with _$Profile {
  const factory Profile({
    @JsonKey(name: 'aspect_ratio') required double aspectRatio,
    required int height,
    @JsonKey(name: 'iso_639_1') String? iso6391,
    @JsonKey(name: 'file_path') required String filePath,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
    required int width,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
