// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';

part 'search_movie_response.freezed.dart';
part 'search_movie_response.g.dart';

@freezed
class SearchMovieResponse with _$SearchMovieResponse {
  const factory SearchMovieResponse({
    required int page,
    required List<Movie> results,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'total_results') required int totalResults,
  }) = _SearchMovieResponse;

  factory SearchMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieResponseFromJson(json);
}
