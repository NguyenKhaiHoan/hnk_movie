import 'package:dio/dio.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/movie_detail_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie_detail.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/movie_repository.dart';

class GetDetailMovieUseCase
    implements UseCaseRemote<MovieDetail, DioException, MovieSimpleRequest> {
  final MovieRepository _movieRepository;

  GetDetailMovieUseCase(this._movieRepository);

  @override
  Future<DataState<MovieDetail, DioException>> call(
      {MovieSimpleRequest? params}) async {
    return await _movieRepository.getDetailMovie(params!);
  }
}
