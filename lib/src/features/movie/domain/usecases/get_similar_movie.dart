import 'package:dio/dio.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/movies_similar_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movies_response.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/movie_repository.dart';

class GetSimilarMoviesUseCase
    implements
        UseCaseRemote<MoviesResponse, DioException, MoviesSimilarRequest> {
  final MovieRepository _movieRepository;

  GetSimilarMoviesUseCase(this._movieRepository);

  @override
  Future<DataState<MoviesResponse, DioException>> call(
      {MoviesSimilarRequest? params}) async {
    return await _movieRepository.getSimilarMovies(params!);
  }
}
