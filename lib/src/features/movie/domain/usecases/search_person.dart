import 'package:dio/dio.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/search_person_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/search_person_response.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/movie_repository.dart';

class SearchPersonUseCase
    implements
        UseCaseRemote<SearchPersonResponse, DioException, SearchPersonRequest> {
  final MovieRepository _movieRepository;

  SearchPersonUseCase(this._movieRepository);

  @override
  Future<DataState<SearchPersonResponse, DioException>> call(
      {SearchPersonRequest? params}) async {
    return await _movieRepository.searchPerson(params!);
  }
}
