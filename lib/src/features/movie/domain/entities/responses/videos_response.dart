import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/video.dart';

part 'videos_response.freezed.dart';
part 'videos_response.g.dart';

@freezed
class VideosResponse with _$VideosResponse {
  factory VideosResponse({
    required int id,
    required List<Video> results,
  }) = _VideosResponse;

  factory VideosResponse.fromJson(Map<String, dynamic> json) =>
      _$VideosResponseFromJson(json);
}
