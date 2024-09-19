import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/core/resources/data_state.dart';
import 'package:hnk_movie/src/di/di.dart';
import 'package:hnk_movie/src/features/app/presentation/providers/language_provider.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/search_movie_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/search_person_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/search_person_response.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/search_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/search_person.dart';

final searchMovieDataProvider =
    StateNotifierProvider<SearchMovieController, AsyncValue<List<Movie>>>(
        (ref) {
  return SearchMovieController(ref: ref);
});

final searchPersonDataProvider =
    StateNotifierProvider<SearchPersonController, AsyncValue<List<Person>>>(
        (ref) {
  return SearchPersonController(ref: ref);
});

final searchStringProvider = StateProvider.autoDispose<String>((ref) => '');

class SearchMovieController extends StateNotifier<AsyncValue<List<Movie>>> {
  SearchMovieController({required this.ref}) : super(const AsyncValue.data([]));

  final Ref ref;

  void searchMovie(SearchMovieRequest request) async {
    var searchMovieUseCase = ref.read(searchMovieProvider);
    var language =
        ref.read(languageControllerProvider).locale.languageCode == 'en'
            ? 'en-US'
            : 'vi-VN';
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => searchMovieData(
        searchMovieUseCase, request.copyWith(language: language)));
  }

  Future<List<Movie>> searchMovieData(
      SearchMovieUseCase searchMovie, SearchMovieRequest request) async {
    try {
      var dataState = await searchMovie.call(params: request);
      if (dataState is DataSuccess) {
        return dataState.data!.results;
      } else {
        throw Exception(dataState.exception);
      }
    } on DataState catch (e) {
      throw Exception(e);
    }
  }
}

class SearchPersonController extends StateNotifier<AsyncValue<List<Person>>> {
  SearchPersonController({required this.ref})
      : super(const AsyncValue.data([]));

  final Ref ref;

  void searchPerson(SearchPersonRequest request) async {
    var searchPersonUseCase = ref.read(searchPersonProvider);
    var language =
        ref.read(languageControllerProvider).locale.languageCode == 'en'
            ? 'en-US'
            : 'vi-VN';
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => searchPersonData(
        searchPersonUseCase, request.copyWith(language: language)));
  }

  Future<List<Person>> searchPersonData(
      SearchPersonUseCase searchPerson, SearchPersonRequest request) async {
    try {
      var dataState = await searchPerson.call(params: request);
      if (dataState is DataSuccess) {
        return dataState.data!.results;
      } else {
        throw Exception(dataState.exception);
      }
    } on DataState catch (e) {
      throw Exception(e);
    }
  }
}

final movieSearchLastMovieProvider =
    StateNotifierProvider<MovieSearchLastController, MovieSearchLastState>(
        (ref) {
  return MovieSearchLastController();
});

class MovieSearchLastState {
  final List<Movie> movies;
  MovieSearchLastState({
    required this.movies,
  });

  MovieSearchLastState copyWith({
    List<Movie>? movies,
  }) {
    return MovieSearchLastState(
      movies: movies ?? this.movies,
    );
  }
}

class MovieSearchLastController extends StateNotifier<MovieSearchLastState> {
  MovieSearchLastController() : super(MovieSearchLastState(movies: []));

  void addMovies(List<Movie> newListMovies) {
    state = state.copyWith(movies: newListMovies);
  }
}
