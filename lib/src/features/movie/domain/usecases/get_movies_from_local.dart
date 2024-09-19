import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';
import 'package:hnk_movie/src/features/movie/domain/repositories/movie_repository.dart';
import '../../../../core/usecases/usecase.dart';

class GetMoviesFromLocalUsecase implements UseCaseLocal<List<Movie>, void> {
  final MovieRepository _movieRepository;

  GetMoviesFromLocalUsecase(this._movieRepository);

  @override
  Future<List<Movie>> call({void params}) async {
    return await _movieRepository.getMoviesFromLocal();
  }
}
