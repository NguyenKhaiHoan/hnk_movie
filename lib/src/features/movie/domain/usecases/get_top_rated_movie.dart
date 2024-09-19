import 'package:dio/dio.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/movie_lists_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movies_response.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/movie_repository.dart';

class GetTopRatedMoviesUseCase
    implements UseCaseRemote<MoviesResponse, DioException, MovieListsRequest> {
  final MovieRepository _movieRepository;

  GetTopRatedMoviesUseCase(this._movieRepository);

  @override
  Future<DataState<MoviesResponse, DioException>> call(
      {MovieListsRequest? params}) async {
    return await _movieRepository.getTopRatedMovies(params!);
  }
}
