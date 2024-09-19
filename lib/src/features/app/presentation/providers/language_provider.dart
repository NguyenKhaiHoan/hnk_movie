// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/di/di.dart';

final languageControllerProvider =
    StateNotifierProvider<LanguageController, LanguageState>((ref) {
  final repository = ref.watch(appRepositoryProvider);
  final languageCode = repository.getLocalLanguage();
  return LanguageController(languageCode: languageCode, ref: ref);
});

class LanguageState {
  final Locale locale;
  LanguageState({
    required this.locale,
  });

  LanguageState copyWith({
    Locale? locale,
  }) {
    return LanguageState(
      locale: locale ?? this.locale,
    );
  }
}

class LanguageController extends StateNotifier<LanguageState> {
  LanguageController({required this.languageCode, required this.ref})
      : super(LanguageState(locale: Locale(languageCode)));

  final String languageCode;
  final Ref ref;

  void onLocaleChanged(String code) {
    final repository = ref.watch(appRepositoryProvider);
    repository.updateLanguage(code);
    state = state.copyWith(locale: Locale(code));
  }
}
