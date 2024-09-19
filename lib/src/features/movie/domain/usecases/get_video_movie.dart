import 'package:dio/dio.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/movie_detail_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/videos_response.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/movie_repository.dart';

class GetVideosMovieUseCase
    implements UseCaseRemote<VideosResponse, DioException, MovieSimpleRequest> {
  final MovieRepository _movieRepository;

  GetVideosMovieUseCase(this._movieRepository);

  @override
  Future<DataState<VideosResponse, DioException>> call(
      {MovieSimpleRequest? params}) async {
    return await _movieRepository.getVideosMovie(params!);
  }
}
