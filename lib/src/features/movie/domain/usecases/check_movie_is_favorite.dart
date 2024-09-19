import 'package:hnk_movie/src/features/movie/domain/repositories/movie_repository.dart';
import '../../../../core/usecases/usecase.dart';

class CheckMovieIsFavoriteUsecase implements UseCaseLocal<bool, int> {
  final MovieRepository _movieRepository;

  CheckMovieIsFavoriteUsecase(this._movieRepository);

  @override
  Future<bool> call({int? params}) async {
    return await _movieRepository.checkMovieIsFavoriteed(params!);
  }
}
