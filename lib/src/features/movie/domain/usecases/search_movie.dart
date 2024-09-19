import 'package:dio/dio.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/search_movie_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/search_movie_response.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/movie_repository.dart';

class SearchMovieUseCase
    implements
        UseCaseRemote<SearchMovieResponse, DioException, SearchMovieRequest> {
  final MovieRepository _movieRepository;

  SearchMovieUseCase(this._movieRepository);

  @override
  Future<DataState<SearchMovieResponse, DioException>> call(
      {SearchMovieRequest? params}) async {
    return await _movieRepository.searchMovie(params!);
  }
}
