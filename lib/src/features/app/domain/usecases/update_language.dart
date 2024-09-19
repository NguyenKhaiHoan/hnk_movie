import 'package:hnk_movie/src/features/app/domain/repositories/app_repo.dart';

import '../../../../core/usecases/usecase.dart';

class UpdateLanguageUseCase implements UseCaseLocal<void, String> {
  final AppRepository _appRepository;

  UpdateLanguageUseCase(this._appRepository);

  @override
  Future<void> call({String? params}) async {
    return _appRepository.updateLanguage(params!);
  }
}
