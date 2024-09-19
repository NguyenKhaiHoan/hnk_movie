// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/core/resources/data_state.dart';
import 'package:hnk_movie/src/di/di.dart';
import 'package:hnk_movie/src/features/app/presentation/providers/language_provider.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/movie_lists_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_now_playing_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_popular_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_top_rated_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_upcoming_movie.dart';

final fetchListNowPlayingMovieProvider =
    FutureProvider.family<List<Movie>, MovieListsRequest?>((ref, request) {
  var nowPlayingMovieUseCase = ref.read(getNowPlayingMoviesProvider);
  var language =
      ref.read(languageControllerProvider).locale.languageCode == 'en'
          ? 'en-US'
          : 'vi-VN';
  var finalRequest = request?.copyWith(language: language) ??
      MovieListsRequest(language: language);
  return fetchListNowPlayingMovie(nowPlayingMovieUseCase, finalRequest);
});

Future<List<Movie>> fetchListNowPlayingMovie(
    GetNowPlayingMoviesUseCase nowPlayingMovie,
    MovieListsRequest request) async {
  try {
    var dataState = await nowPlayingMovie.call(params: request);
    if (dataState is DataSuccess) {
      return dataState.data!.results ?? [];
    } else {
      throw Exception(dataState.exception);
    }
  } on DataState catch (e) {
    throw Exception(e);
  }
}

final fetchListTopRatedMovieProvider =
    FutureProvider.family<List<Movie>, MovieListsRequest?>((ref, request) {
  var topRatedMovieUseCase = ref.read(getTopRatedMoviesProvider);
  var language =
      ref.read(languageControllerProvider).locale.languageCode == 'en'
          ? 'en-US'
          : 'vi-VN';
  var finalRequest = request?.copyWith(language: language) ??
      MovieListsRequest(language: language);
  return fetchListTopRatedMovie(topRatedMovieUseCase, finalRequest);
});

Future<List<Movie>> fetchListTopRatedMovie(
    GetTopRatedMoviesUseCase topRatedMovie, MovieListsRequest request) async {
  try {
    var dataState = await topRatedMovie.call(params: request);
    if (dataState is DataSuccess) {
      return dataState.data!.results ?? [];
    } else {
      throw Exception(dataState.exception);
    }
  } on DataState catch (e) {
    throw Exception(e);
  }
}

final fetchListUpcomingMovieProvider =
    FutureProvider.family<List<Movie>, MovieListsRequest?>((ref, request) {
  var upcomingMovieUseCase = ref.read(getUpcomingMoviesProvider);
  var language =
      ref.read(languageControllerProvider).locale.languageCode == 'en'
          ? 'en-US'
          : 'vi-VN';
  var finalRequest = request?.copyWith(language: language) ??
      MovieListsRequest(language: language);
  return fetchListUpcomingMovie(upcomingMovieUseCase, finalRequest);
});

Future<List<Movie>> fetchListUpcomingMovie(
    GetUpcomingMoviesUseCase upcomingMovie, MovieListsRequest request) async {
  try {
    var dataState = await upcomingMovie.call(params: request);
    if (dataState is DataSuccess) {
      return dataState.data!.results ?? [];
    } else {
      throw Exception(dataState.exception);
    }
  } on DataState catch (e) {
    throw Exception(e);
  }
}

final fetchListPopularMovieProvider =
    FutureProvider.family<List<Movie>, MovieListsRequest?>((ref, request) {
  var popularMovieUseCase = ref.read(getPopularMoviesProvider);
  var language =
      ref.read(languageControllerProvider).locale.languageCode == 'en'
          ? 'en-US'
          : 'vi-VN';
  var finalRequest = request?.copyWith(language: language) ??
      MovieListsRequest(language: language);
  return fetchListPopularMovie(popularMovieUseCase, finalRequest);
});

Future<List<Movie>> fetchListPopularMovie(
    GetPopularMoviesUseCase popularMovie, MovieListsRequest request) async {
  try {
    var dataState = await popularMovie.call(params: request);
    if (dataState is DataSuccess) {
      return dataState.data!.results ?? [];
    } else {
      throw Exception(dataState.exception);
    }
  } on DataState catch (e) {
    throw Exception(e);
  }
}

final fetchListIsWatchingMovieProvider =
    FutureProvider.family<List<Movie>, MovieListsRequest?>((ref, request) {
  var topRatedMovieUseCase = ref.read(getTopRatedMoviesProvider);
  var language =
      ref.read(languageControllerProvider).locale.languageCode == 'en'
          ? 'en-US'
          : 'vi-VN';
  var finalRequest = request?.copyWith(language: language) ??
      MovieListsRequest(language: language);
  return fetchListTopRatedMovie(topRatedMovieUseCase, finalRequest);
});

final historyMovieProvider =
    StateNotifierProvider<HistoryMovieController, HistoryMovieState>((ref) {
  return HistoryMovieController();
});

class HistoryMovieState {
  final List<Movie> movies;
  HistoryMovieState({
    required this.movies,
  });

  HistoryMovieState copyWith({
    List<Movie>? movies,
  }) {
    return HistoryMovieState(
      movies: movies ?? this.movies,
    );
  }
}

class HistoryMovieController extends StateNotifier<HistoryMovieState> {
  HistoryMovieController() : super(HistoryMovieState(movies: []));

  void addMovieToHistory(Movie movie) {
    var history = state.movies;
    if (history.contains(movie)) {
      history.remove(movie);
    }
    history.insert(0, movie);
    state = state.copyWith(movies: history);
  }
}
