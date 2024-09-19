import 'package:dio/dio.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/movie_detail_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/credit_response.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/movie_repository.dart';

class GetCreditsMovieUseCase
    implements UseCaseRemote<CreditResponse, DioException, MovieSimpleRequest> {
  final MovieRepository _movieRepository;

  GetCreditsMovieUseCase(this._movieRepository);

  @override
  Future<DataState<CreditResponse, DioException>> call(
      {MovieSimpleRequest? params}) async {
    return await _movieRepository.getCreditsMovie(params!);
  }
}
