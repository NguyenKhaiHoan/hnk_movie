import 'package:get_storage/get_storage.dart';

abstract class LanguageLocalDataSource {
  void updateLanguage(String code);
  String getLocalLanguage();
}

class LanguageLocalDataSourceImpl extends LanguageLocalDataSource {
  final GetStorage localStorage = GetStorage();

  @override
  String getLocalLanguage() {
    return localStorage.read('LANGUAGE_CODE') ?? 'en';
  }

  @override
  void updateLanguage(String code) {
    localStorage.write('LANGUAGE_CODE', code);
  }
}
