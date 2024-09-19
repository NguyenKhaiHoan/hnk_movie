// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/genre.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/production_company.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/production_country.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/spoken_language.dart';

part 'movie_detail.freezed.dart';
part 'movie_detail.g.dart';

@freezed
class MovieDetail with _$MovieDetail {
  const factory MovieDetail({
    required bool adult,
    @JsonKey(name: 'backdrop_path') required String backdropPath,
    required int budget,
    required List<Genre> genres,
    required String homepage,
    required int id,
    @JsonKey(name: 'imdb_id') required String imdbId,
    @JsonKey(name: 'origin_country') required List<String> originCountry,
    @JsonKey(name: 'original_language') required String originalLanguage,
    @JsonKey(name: 'original_title') required String originalTitle,
    required String overview,
    required double popularity,
    @JsonKey(name: 'poster_path') required String posterPath,
    @JsonKey(name: 'production_companies')
    required List<ProductionCompany> productionCompanies,
    @JsonKey(name: 'production_countries')
    required List<ProductionCountry> productionCountries,
    @JsonKey(name: 'release_date') required String releaseDate,
    required int revenue,
    required int runtime,
    @JsonKey(name: 'spoken_languages')
    required List<SpokenLanguage> spokenLanguages,
    required String status,
    required String tagline,
    required String title,
    required bool video,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
  }) = _MovieDetail;

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);
}
