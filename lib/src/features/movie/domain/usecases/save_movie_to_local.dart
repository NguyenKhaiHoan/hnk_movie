import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';
import 'package:hnk_movie/src/features/movie/domain/repositories/movie_repository.dart';
import '../../../../core/usecases/usecase.dart';

class SaveMovieToLocalUsecase implements UseCaseLocal<void, Movie> {
  final MovieRepository _movieRepository;

  SaveMovieToLocalUsecase(this._movieRepository);

  @override
  Future<void> call({Movie? params}) async {
    return await _movieRepository.saveMovieToLocal(params!);
  }
}
