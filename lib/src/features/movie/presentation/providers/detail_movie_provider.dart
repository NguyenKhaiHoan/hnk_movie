import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/core/resources/data_state.dart';
import 'package:hnk_movie/src/di/di.dart';
import 'package:hnk_movie/src/features/app/presentation/providers/language_provider.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/movie_detail_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/movies_similar_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/cast.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie_detail.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/video.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_credit_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_detail_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_similar_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_video_movie.dart';

final fetchDetailMovieProvider =
    FutureProvider.family<MovieDetail, MovieSimpleRequest>((ref, request) {
  var detailMovieUseCase = ref.read(getDetailMovieProvider);
  var language =
      ref.read(languageControllerProvider).locale.languageCode == 'en'
          ? 'en-US'
          : 'vi-VN';
  return fetchDetailMovie(
      detailMovieUseCase, request.copyWith(language: language));
});

Future<MovieDetail> fetchDetailMovie(
    GetDetailMovieUseCase detailMovie, MovieSimpleRequest request) async {
  try {
    var dataState = await detailMovie.call(params: request);
    if (dataState is DataSuccess) {
      return dataState.data!;
    } else {
      throw Exception(dataState.exception);
    }
  } on DataState catch (e) {
    throw Exception(e);
  }
}

final fetchListVideoMovieProvider =
    FutureProvider.family<List<Video>, MovieSimpleRequest>((ref, request) {
  var videosMovieUseCase = ref.read(getVideosMovieProvider);
  var language =
      ref.read(languageControllerProvider).locale.languageCode == 'en'
          ? 'en-US'
          : 'vi-VN';
  return fetchVideosMovie(
      videosMovieUseCase, request.copyWith(language: language));
});

Future<List<Video>> fetchVideosMovie(
    GetVideosMovieUseCase videosMovie, MovieSimpleRequest request) async {
  try {
    var dataState = await videosMovie.call(params: request);
    if (dataState is DataSuccess) {
      return dataState.data!.results;
    } else {
      throw Exception(dataState.exception);
    }
  } on DataState catch (e) {
    throw Exception(e);
  }
}

final fetchListCastMovieProvider =
    FutureProvider.family<List<Cast>, MovieSimpleRequest>((ref, request) {
  var castsMovieUseCase = ref.read(getCreditsMovieProvider);
  var language =
      ref.read(languageControllerProvider).locale.languageCode == 'en'
          ? 'en-US'
          : 'vi-VN';
  return fetchCastsMovie(
      castsMovieUseCase, request.copyWith(language: language));
});

Future<List<Cast>> fetchCastsMovie(
    GetCreditsMovieUseCase castsMovie, MovieSimpleRequest request) async {
  try {
    var dataState = await castsMovie.call(params: request);
    if (dataState is DataSuccess) {
      return dataState.data!.cast;
    } else {
      throw Exception(dataState.exception);
    }
  } on DataState catch (e) {
    throw Exception(e);
  }
}

final fetchListSimilarMovieProvider =
    FutureProvider.family<List<Movie>, int>((ref, movieId) {
  var similarMovieUseCase = ref.read(getSimilarMoviesProvider);
  var language =
      ref.read(languageControllerProvider).locale.languageCode == 'en'
          ? 'en-US'
          : 'vi-VN';
  var request = MoviesSimilarRequest(movieId: movieId, language: language);
  return fetchListSimilarMovie(similarMovieUseCase, request);
});

Future<List<Movie>> fetchListSimilarMovie(
    GetSimilarMoviesUseCase similarMovie, MoviesSimilarRequest request) async {
  try {
    var dataState = await similarMovie.call(params: request);
    if (dataState is DataSuccess) {
      return dataState.data!.results ?? [];
    } else {
      throw Exception(dataState.exception);
    }
  } on DataState catch (e) {
    throw Exception(e);
  }
}
