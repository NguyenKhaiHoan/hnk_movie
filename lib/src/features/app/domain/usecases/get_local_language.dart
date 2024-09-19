import 'package:hnk_movie/src/features/app/domain/repositories/app_repo.dart';

import '../../../../core/usecases/usecase.dart';

class GetLocalLanguageUseCase implements UseCaseLocal<String, void> {
  final AppRepository _appRepository;

  GetLocalLanguageUseCase(this._appRepository);

  @override
  Future<String> call({void params}) async {
    return _appRepository.getLocalLanguage();
  }
}
