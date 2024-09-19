import 'package:hnk_movie/src/features/movie/domain/repositories/movie_repository.dart';
import '../../../../core/usecases/usecase.dart';

class DeleteMovieUsecase implements UseCaseLocal<void, int> {
  final MovieRepository _movieRepository;

  DeleteMovieUsecase(this._movieRepository);

  @override
  Future<void> call({int? params}) async {
    return await _movieRepository.deleteMovie(params!);
  }
}
