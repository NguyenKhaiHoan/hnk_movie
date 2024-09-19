import 'package:hnk_movie/src/features/app/domain/entities/language.dart';

class HAppLanguage {
  const HAppLanguage._();

  static const languages = [
    Language(code: 'en', language: 'en-US', value: 'English'),
    Language(code: 'vi', language: 'vi-VN', value: 'Tiếng Việt')
  ];
}
