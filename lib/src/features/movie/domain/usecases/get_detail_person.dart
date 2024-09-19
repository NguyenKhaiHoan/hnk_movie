import 'package:dio/dio.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/person_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/person_detail.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/movie_repository.dart';

class GetDetailPersonUseCase
    implements UseCaseRemote<PersonDetail, DioException, PersonRequest> {
  final MovieRepository _movieRepository;

  GetDetailPersonUseCase(this._movieRepository);

  @override
  Future<DataState<PersonDetail, DioException>> call(
      {PersonRequest? params}) async {
    return await _movieRepository.getDetailPerson(params!);
  }
}
