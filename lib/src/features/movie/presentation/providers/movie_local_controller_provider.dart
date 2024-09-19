import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/di/di.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/check_movie_is_favorite.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/delete_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_movies_from_local.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/save_movie_to_local.dart';

final movieLocalControllerProvider =
    StateNotifierProvider<MovieLocalController, MovieLocalState>((ref) {
  final checkMovieIsFavoritedUsecase = ref.read(checkMovieIsFavoriteProvider);
  final deleteMovie = ref.read(deleteMovieProvider);
  final saveMovieToLocal = ref.read(saveMovieToLocalProvider);
  final getMoviesFormLocal = ref.read(getMoviesFromLocalProvider);
  return MovieLocalController(
      checkMovieIsFavoriteUsecase: checkMovieIsFavoritedUsecase,
      deleteMovieUsecase: deleteMovie,
      saveMovieToLocalUsecase: saveMovieToLocal,
      getMoviesFromLocalUsecase: getMoviesFormLocal);
});

class MovieLocalState {
  final List<Movie> movies;
  final Map<int, bool> favoriteStatus;

  MovieLocalState({
    required this.movies,
    this.favoriteStatus = const {},
  });

  MovieLocalState copyWith({
    bool? isLoading,
    List<Movie>? movies,
    Map<int, bool>? favoriteStatus,
  }) {
    return MovieLocalState(
      movies: movies ?? this.movies,
      favoriteStatus: favoriteStatus ?? this.favoriteStatus,
    );
  }
}

class MovieLocalController extends StateNotifier<MovieLocalState> {
  final CheckMovieIsFavoriteUsecase checkMovieIsFavoriteUsecase;
  final SaveMovieToLocalUsecase saveMovieToLocalUsecase;
  final GetMoviesFromLocalUsecase getMoviesFromLocalUsecase;
  final DeleteMovieUsecase deleteMovieUsecase;

  MovieLocalController({
    required this.checkMovieIsFavoriteUsecase,
    required this.deleteMovieUsecase,
    required this.getMoviesFromLocalUsecase,
    required this.saveMovieToLocalUsecase,
  }) : super(MovieLocalState(movies: []));

  Future<void> toggleFavoriteMovie(Movie movie, bool isFavorited) async {
    if (isFavorited) {
      await deleteMovieUsecase(params: movie.id!);
    } else {
      await saveMovieToLocalUsecase(params: movie);
    }
    await checkMovieIsFavorite(movie.id!);
  }

  Future<void> loadFavoriteMovies() async {
    final movies = await getMoviesFromLocalUsecase.call();
    final favoriteStatus = <int, bool>{};

    for (var movie in movies) {
      final isFavorited = await checkMovieIsFavoriteUsecase(params: movie.id!);
      favoriteStatus[movie.id!] = isFavorited;
    }
    state = state.copyWith(movies: movies, favoriteStatus: favoriteStatus);
  }

  Future<void> deleteMovie(int movieId) async {
    await deleteMovieUsecase(params: movieId);
    await loadFavoriteMovies();
  }

  Future<void> checkMovieIsFavorite(int movieId) async {
    final isFavorited = await checkMovieIsFavoriteUsecase(params: movieId);
    final updatedStatus = {...state.favoriteStatus, movieId: isFavorited};
    state = state.copyWith(favoriteStatus: updatedStatus);
  }
}
