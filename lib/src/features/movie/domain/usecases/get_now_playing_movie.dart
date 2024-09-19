import 'package:dio/dio.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/movie_lists_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movies_response.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/movie_repository.dart';

class GetNowPlayingMoviesUseCase
    implements UseCaseRemote<MoviesResponse, DioException, MovieListsRequest> {
  final MovieRepository _movieRepository;

  GetNowPlayingMoviesUseCase(this._movieRepository);

  @override
  Future<DataState<MoviesResponse, DioException>> call(
      {MovieListsRequest? params}) async {
    return await _movieRepository.getNowPlayingMovies(params!);
  }
}
