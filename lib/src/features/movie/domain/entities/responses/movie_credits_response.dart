// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_credits_response.freezed.dart';
part 'movie_credits_response.g.dart';

@freezed
class MovieCreditsPersonResponse with _$MovieCreditsPersonResponse {
  const factory MovieCreditsPersonResponse({
    required List<CreditsCast> cast,
    required List<CreditsCrew> crew,
    int? id,
  }) = _MovieCreditsPersonResponse;

  factory MovieCreditsPersonResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditsPersonResponseFromJson(json);
}

@freezed
class CreditsCast with _$CreditsCast {
  const factory CreditsCast({
    bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') required List<int> genreIds,
    int? id,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    String? overview,
    double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    String? title,
    bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    String? character,
    @JsonKey(name: 'credit_id') String? creditId,
    int? order,
  }) = _CreditsCast;

  factory CreditsCast.fromJson(Map<String, dynamic> json) =>
      _$CreditsCastFromJson(json);
}

@freezed
class CreditsCrew with _$CreditsCrew {
  const factory CreditsCrew({
    bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') required List<int> genreIds,
    int? id,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    String? overview,
    double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    String? title,
    bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    String? department,
    String? job,
    @JsonKey(name: 'credit_id') String? creditId,
  }) = _CreditsCrew;

  factory CreditsCrew.fromJson(Map<String, dynamic> json) =>
      _$CreditsCrewFromJson(json);
}
