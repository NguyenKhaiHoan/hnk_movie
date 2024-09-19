import 'package:dio/dio.dart';
import 'package:hnk_movie/src/core/resources/data_state.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/movie_detail_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/movie_lists_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/movies_similar_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/person_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/search_movie_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/search_person_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/credit_response.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/images_person_response.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie_credits_response.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie_detail.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movies_response.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/person_detail.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/search_movie_response.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/search_person_response.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/videos_response.dart';

abstract class MovieRepository {
  Future<DataState<MoviesResponse, DioException>> getNowPlayingMovies(
      MovieListsRequest request);
  Future<DataState<MoviesResponse, DioException>> getPopularMovies(
      MovieListsRequest request);
  Future<DataState<MoviesResponse, DioException>> getTopRatedMovies(
      MovieListsRequest request);
  Future<DataState<MoviesResponse, DioException>> getUpcomingMovies(
      MovieListsRequest request);
  Future<DataState<MovieDetail, DioException>> getDetailMovie(
      MovieSimpleRequest request);
  Future<DataState<MoviesResponse, DioException>> getSimilarMovies(
      MoviesSimilarRequest request);
  Future<DataState<CreditResponse, DioException>> getCreditsMovie(
      MovieSimpleRequest request);
  Future<DataState<VideosResponse, DioException>> getVideosMovie(
      MovieSimpleRequest request);
  Future<DataState<PersonDetail, DioException>> getDetailPerson(
      PersonRequest request);
  Future<DataState<ImagesPersonResponse, DioException>> getImagesPerson(
      int personId);
  Future<DataState<MovieCreditsPersonResponse, DioException>>
      getMovieCreditsPerson(PersonRequest request);
  Future<DataState<SearchMovieResponse, DioException>> searchMovie(
      SearchMovieRequest request);
  Future<DataState<SearchPersonResponse, DioException>> searchPerson(
      SearchPersonRequest request);

  Future<void> saveMovieToLocal(Movie movie);
  Future<List<Movie>> getMoviesFromLocal();
  Future<void> deleteMovie(int movieId);
  Future<bool> checkMovieIsFavoriteed(int movieId);
}
