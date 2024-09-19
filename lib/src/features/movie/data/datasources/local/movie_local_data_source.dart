import 'package:hnk_movie/src/core/services/local_service.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';

abstract class MovieLocalDataSource {
  Future<void> saveMovieToLocal(Movie movie);
  Future<List<Movie>> getMoviesFromLocal();
  Future<void> deleteMovie(int movieId);
  Future<bool> checkMovieIsFavorited(int movieId);
}

class MovieLocalDataSourceImpl extends MovieLocalDataSource {
  @override
  Future<bool> checkMovieIsFavorited(int movieId) async {
    var favoritedMovies = await getMoviesFromLocal();
    return favoritedMovies.indexWhere((movie) => movie.id == movieId) >= 0;
  }

  @override
  Future<void> deleteMovie(int movieId) async {
    var favoritedMovies = await getMoviesFromLocal();
    favoritedMovies.removeWhere((movie) => movie.id == movieId);
    await HLocalService.instance()
        .saveData('FavoritedMovies', favoritedMovies.map((e) => e.toJson()).toList());
  }

  @override
  Future<List<Movie>> getMoviesFromLocal() async {
    final favoritedMoviesData =
        HLocalService.instance().getData<List<dynamic>>('FavoritedMovies');
    if (favoritedMoviesData != null) {
      final favoritedMovies = <Movie>[];
      favoritedMovies.addAll(favoritedMoviesData
          .map((e) => Movie.fromJson(e as Map<String, dynamic>)));
      return favoritedMovies;
    }
    return [];
  }

  @override
  Future<void> saveMovieToLocal(Movie movie) async {
    var favoritedMovies = await getMoviesFromLocal();
    favoritedMovies.add(movie);
    await HLocalService.instance()
        .saveData('FavoritedMovies', favoritedMovies.map((e) => e.toJson()).toList());
  }
}
