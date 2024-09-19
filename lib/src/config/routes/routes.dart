import 'package:flutter/material.dart';
import 'package:hnk_movie/src/features/app/presentation/pages/base_page.dart';
import 'package:hnk_movie/src/features/app/presentation/pages/setting.dart';
import 'package:hnk_movie/src/features/auth/presentation/pages/login.dart';
import 'package:hnk_movie/src/features/auth/presentation/pages/sign_up.dart';
import 'package:hnk_movie/src/features/auth/presentation/pages/splash.dart';
import 'package:hnk_movie/src/features/auth/presentation/pages/welcome.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/cast.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';
import 'package:hnk_movie/src/features/movie/presentation/pages/cast_detail.dart';
import 'package:hnk_movie/src/features/movie/presentation/pages/favorite_movie.dart';
import 'package:page_transition/page_transition.dart';

import '../../features/movie/presentation/pages/movie_detail.dart';
import '../../features/movie/presentation/pages/process.dart';
import '../../features/movie/presentation/pages/see_all.dart';

class AppRoutes {
  const AppRoutes._();

  static Route onGenerateRoutes(RouteSettings settings) {
    late Map<String, dynamic> arguments;
    settings.arguments != null
        ? arguments = Map<String, dynamic>.from(settings.arguments as Map)
        : arguments = {};
    switch (settings.name) {
      case '/':
        return _materialRoute(view: const SplashPage());
      case '/welcome':
        return _materialRoute(view: const WelcomePage());
      case '/movie-detail':
        return _materialRoute(view: MovieDetailPage(movie: arguments['movie']));
      case '/cast-detail':
        return _materialRoute(view: CastDetailPage(cast: arguments['cast']));
      case '/see-all':
        return _materialRoute(
            view: SeeAllMovie(
                movies: arguments['movies'], title: arguments['title']));
      case '/favorite-movie':
        return _materialRoute(view: const FavoriteMovie());
      case '/login':
        return _materialRoute(view: const LoginPage());
      case '/sign-up':
        return _materialRoute(view: const SignUpPage());
      case '/process':
        return _materialRoute(view: const ProcessPage());
      case '/base':
        return _materialRoute(view: const BasePage());
      case '/setting':
        return _materialRoute(view: const SettingPage());
      default:
        return _materialRoute(view: const WelcomePage());
    }
  }

  static Route<dynamic> _materialRoute(
      {required Widget view, PageTransitionType? type}) {
    return PageTransition(
        child: view,
        type: type ?? PageTransitionType.fade,
        duration: const Duration(milliseconds: 800),
        reverseDuration: const Duration(milliseconds: 800));
  }

  static void onMoviePressed(BuildContext context, Movie movie) {
    Navigator.pushNamed(context, '/movie-detail', arguments: {'movie': movie});
  }

  static void onCastPressed(BuildContext context, Cast cast) {
    Navigator.pushNamed(context, '/cast-detail', arguments: {'cast': cast});
  }

  static void onSeeAllPressed(
      {required BuildContext context,
      required List<Movie> movies,
      required String title}) {
    Navigator.pushNamed(context, '/see-all',
        arguments: {'movies': movies, 'title': title});
  }
}
