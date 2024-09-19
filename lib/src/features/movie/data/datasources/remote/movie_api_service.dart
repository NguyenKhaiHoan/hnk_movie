import 'package:dio/dio.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/credit_response.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/images_person_response.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie_credits_response.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie_detail.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movies_response.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/person_detail.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/search_movie_response.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/search_person_response.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/videos_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/api.dart';

part 'movie_api_service.g.dart';

@RestApi(baseUrl: HAppAPI.movieBaseUrl)
abstract class MovieApiService {
  factory MovieApiService(Dio dio) = _MovieApiService;

  /// language (string) Defaults to en-US,
  /// page (int32) Defaults to 1
  @GET('/movie/now_playing')
  Future<HttpResponse<MoviesResponse>> getNowPlayingMovies({
    @Query('api_key') required String apiKey,
    @Query('language') required String language,
    @Query('page') required int page,
  });

  /// language (string) Defaults to en-US,
  /// page (int32) Defaults to 1
  @GET('/movie/popular')
  Future<HttpResponse<MoviesResponse>> getPopularMovies({
    @Query('api_key') required String apiKey,
    @Query('language') required String language,
    @Query('page') required int page,
  });

  /// language (string) Defaults to en-US,
  /// page (int32) Defaults to 1
  @GET('/movie/top_rated')
  Future<HttpResponse<MoviesResponse>> getTopRatedMovies({
    @Query('api_key') required String apiKey,
    @Query('language') required String language,
    @Query('page') required int page,
  });

  /// language (string) Defaults to en-US,
  /// page (int32) Defaults to 1
  @GET('/movie/upcoming')
  Future<HttpResponse<MoviesResponse>> getUpcomingMovies({
    @Query('api_key') required String apiKey,
    @Query('language') required String language,
    @Query('page') required int page,
  });

  /// movie_id (int32) required
  /// language (string) Defaults to en-US,
  /// page (int32) Defaults to 1
  @GET('/movie/{movie_id}/similar')
  Future<HttpResponse<MoviesResponse>> getSimilarMovies(
      {@Path('movie_id') required int movieId,
      @Query('api_key') required String apiKey,
      @Query('language') required String language,
      @Query('page') required int page});

  /// movie_id (int32) required
  /// language (string) Defaults to en-US,
  @GET('/movie/{movie_id}')
  Future<HttpResponse<MovieDetail>> getDetailMovie(
      {@Path('movie_id') required int movieId,
      @Query('api_key') required String apiKey,
      @Query('language') required String language});

  /// movie_id (int32) required
  /// language (string) Defaults to en-US,
  @GET('/movie/{movie_id}/credits')
  Future<HttpResponse<CreditResponse>> getCreditsMovie(
      {@Path('movie_id') required int movieId,
      @Query('api_key') required String apiKey,
      @Query('language') required String language});

  /// movie_id (int32) required
  /// language (string) Defaults to en-US,
  @GET('/movie/{movie_id}/videos')
  Future<HttpResponse<VideosResponse>> getVideosMovie(
      {@Path('movie_id') required int movieId,
      @Query('api_key') required String apiKey,
      @Query('language') required String language});

  @GET('/person/{person_id}/images')
  Future<HttpResponse<ImagesPersonResponse>> getImagesPerson({
    @Path('person_id') required int personId,
    @Query('api_key') required String apiKey,
  });

  @GET('/person/{person_id}/movie_credits')
  Future<HttpResponse<MovieCreditsPersonResponse>> getMovieCreditsPerson(
      {@Path('person_id') required int personId,
      @Query('api_key') required String apiKey,
      @Query('language') required String language});

  @GET('/person/{person_id}')
  Future<HttpResponse<PersonDetail>> getDetailPerson(
      {@Path('person_id') required int personId,
      @Query('api_key') required String apiKey,
      @Query('language') required String language});

  @GET('/search/movie')
  Future<HttpResponse<SearchMovieResponse>> searchMovie({
    @Query('api_key') required String apiKey,
    @Query('query') required String query,
    @Query('include_adult') required bool includeAdult,
    @Query('language') required String language,
    @Query('primary_release_year') String? primaryReleaseYear,
    @Query('page') required int page,
    @Query('region') String? region,
    @Query('year') String? year,
  });

  @GET('/search/person')
  Future<HttpResponse<SearchPersonResponse>> searchPerson({
    @Query('api_key') required String apiKey,
    @Query('query') required String query,
    @Query('include_adult') required bool includeAdult,
    @Query('language') required String language,
    @Query('page') required int page,
  });
}
