import 'package:dio/dio.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/images_person_response.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/movie_repository.dart';

class GetImagesPersonUseCase
    implements UseCaseRemote<ImagesPersonResponse, DioException, int> {
  final MovieRepository _movieRepository;

  GetImagesPersonUseCase(this._movieRepository);

  @override
  Future<DataState<ImagesPersonResponse, DioException>> call(
      {int? params}) async {
    return await _movieRepository.getImagesPerson(params!);
  }
}
