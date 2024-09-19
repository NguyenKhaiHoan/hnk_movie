import 'package:hnk_movie/src/features/app/data/datasources/language_local_datasource.dart';
import 'package:hnk_movie/src/features/app/domain/repositories/app_repo.dart';

class AppRepositoryImpl extends AppRepository {
  final LanguageLocalDataSource _languageLocalDataSource;

  AppRepositoryImpl(this._languageLocalDataSource);

  @override
  String getLocalLanguage() {
    return _languageLocalDataSource.getLocalLanguage();
  }

  @override
  void updateLanguage(String code) {
    _languageLocalDataSource.updateLanguage(code);
  }
}
