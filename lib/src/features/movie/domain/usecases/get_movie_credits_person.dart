import 'package:dio/dio.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/person_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie_credits_response.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/movie_repository.dart';

class GetMovieCreditsPersonUseCase
    implements
        UseCaseRemote<MovieCreditsPersonResponse, DioException, PersonRequest> {
  final MovieRepository _movieRepository;

  GetMovieCreditsPersonUseCase(this._movieRepository);

  @override
  Future<DataState<MovieCreditsPersonResponse, DioException>> call(
      {PersonRequest? params}) async {
    return await _movieRepository.getMovieCreditsPerson(params!);
  }
}
