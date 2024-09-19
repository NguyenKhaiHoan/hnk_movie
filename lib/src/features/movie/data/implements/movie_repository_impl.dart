import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hnk_movie/src/features/movie/data/datasources/local/movie_local_data_source.dart';
import 'package:hnk_movie/src/features/movie/data/datasources/remote/movie_api_service.dart';
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

import '../../../../core/constants/api.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApiService _movieApiService;
  final MovieLocalDataSource _movieLocalDataSource;

  MovieRepositoryImpl(this._movieApiService, this._movieLocalDataSource);

  @override
  Future<DataState<MoviesResponse, DioException>> getNowPlayingMovies(
      MovieListsRequest request) async {
    try {
      final httpResponse = await _movieApiService.getNowPlayingMovies(
          apiKey: HAppAPI.movieAPIKey,
          language: request.language,
          page: request.page);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<MoviesResponse, DioException>> getPopularMovies(
      MovieListsRequest request) async {
    try {
      final httpResponse = await _movieApiService.getPopularMovies(
          apiKey: HAppAPI.movieAPIKey,
          language: request.language,
          page: request.page);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<MoviesResponse, DioException>> getTopRatedMovies(
      MovieListsRequest request) async {
    try {
      final httpResponse = await _movieApiService.getTopRatedMovies(
          apiKey: HAppAPI.movieAPIKey,
          language: request.language,
          page: request.page);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<MoviesResponse, DioException>> getUpcomingMovies(
      MovieListsRequest request) async {
    try {
      final httpResponse = await _movieApiService.getUpcomingMovies(
          apiKey: HAppAPI.movieAPIKey,
          language: request.language,
          page: request.page);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<MoviesResponse, DioException>> getSimilarMovies(
      MoviesSimilarRequest request) async {
    try {
      final httpResponse = await _movieApiService.getSimilarMovies(
        apiKey: HAppAPI.movieAPIKey,
        movieId: request.movieId,
        language: request.language,
        page: request.page,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<MovieDetail, DioException>> getDetailMovie(
      MovieSimpleRequest request) async {
    try {
      final httpResponse = await _movieApiService.getDetailMovie(
        apiKey: HAppAPI.movieAPIKey,
        movieId: request.movieId,
        language: request.language,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<CreditResponse, DioException>> getCreditsMovie(
      MovieSimpleRequest request) async {
    try {
      final httpResponse = await _movieApiService.getCreditsMovie(
        apiKey: HAppAPI.movieAPIKey,
        movieId: request.movieId,
        language: request.language,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<VideosResponse, DioException>> getVideosMovie(
      MovieSimpleRequest request) async {
    try {
      final httpResponse = await _movieApiService.getVideosMovie(
        apiKey: HAppAPI.movieAPIKey,
        movieId: request.movieId,
        language: request.language,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<PersonDetail, DioException>> getDetailPerson(
      PersonRequest request) async {
    try {
      final httpResponse = await _movieApiService.getDetailPerson(
        apiKey: HAppAPI.movieAPIKey,
        language: request.language,
        personId: request.personId,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<ImagesPersonResponse, DioException>> getImagesPerson(
      int personId) async {
    try {
      final httpResponse = await _movieApiService.getImagesPerson(
        apiKey: HAppAPI.movieAPIKey,
        personId: personId,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<MovieCreditsPersonResponse, DioException>>
      getMovieCreditsPerson(PersonRequest request) async {
    try {
      final httpResponse = await _movieApiService.getMovieCreditsPerson(
        apiKey: HAppAPI.movieAPIKey,
        language: request.language,
        personId: request.personId,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<SearchMovieResponse, DioException>> searchMovie(
      SearchMovieRequest request) async {
    try {
      final httpResponse = await _movieApiService.searchMovie(
        apiKey: HAppAPI.movieAPIKey,
        query: request.query,
        language: request.language,
        page: request.page,
        includeAdult: request.includeAdult,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<SearchPersonResponse, DioException>> searchPerson(
      SearchPersonRequest request) async {
    try {
      final httpResponse = await _movieApiService.searchPerson(
        apiKey: HAppAPI.movieAPIKey,
        language: request.language,
        page: request.page,
        includeAdult: request.includeAdult,
        query: request.query,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<bool> checkMovieIsFavoriteed(int movieId) async {
    return await _movieLocalDataSource.checkMovieIsFavorited(movieId);
  }

  @override
  Future<void> deleteMovie(int movieId) async {
    await _movieLocalDataSource.deleteMovie(movieId);
  }

  @override
  Future<List<Movie>> getMoviesFromLocal() async {
    return await _movieLocalDataSource.getMoviesFromLocal();
  }

  @override
  Future<void> saveMovieToLocal(Movie movie) async {
    await _movieLocalDataSource.saveMovieToLocal(movie);
  }
}
