import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/app_localization.dart';
import 'package:hnk_movie/src/core/constants/language.dart';
import 'package:hnk_movie/src/features/app/presentation/providers/language_provider.dart';
import 'package:hnk_movie/src/features/auth/presentation/pages/splash.dart';

import 'firebase_options.dart';
import 'src/config/routes/routes.dart';
import 'src/config/theme/theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var state = ref.watch(languageControllerProvider);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Movie app',
            theme: HAppTheme().theme,
            initialRoute: '/',
            onGenerateRoute: AppRoutes.onGenerateRoutes,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales:
                HAppLanguage.languages.map((e) => Locale(e.code)).toList(),
            locale: state.locale,
            home: const SplashPage());
      },
    );
  }
}
