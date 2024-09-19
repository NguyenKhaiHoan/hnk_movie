import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/interceptors/timeout_inceptor.dart';
import 'package:hnk_movie/src/features/app/data/datasources/language_local_datasource.dart';
import 'package:hnk_movie/src/features/app/data/implements/app_repo_impl.dart';
import 'package:hnk_movie/src/features/app/domain/repositories/app_repo.dart';
import 'package:hnk_movie/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:hnk_movie/src/features/auth/data/implements/auth_repo_impl.dart';
import 'package:hnk_movie/src/features/auth/domain/entities/user.dart';
import 'package:hnk_movie/src/features/auth/domain/repositories/auth_repo.dart';
import 'package:hnk_movie/src/features/auth/domain/usecases/log_out_usecase.dart';
import 'package:hnk_movie/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:hnk_movie/src/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:hnk_movie/src/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:hnk_movie/src/features/movie/data/datasources/local/movie_local_data_source.dart';
import 'package:hnk_movie/src/features/movie/data/datasources/remote/movie_api_service.dart';
import 'package:hnk_movie/src/features/movie/data/implements/movie_repository_impl.dart';
import 'package:hnk_movie/src/features/movie/domain/repositories/movie_repository.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/check_movie_is_favorite.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/delete_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_credit_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_detail_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_detail_person.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_images_person.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_movie_credits_person.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_movies_from_local.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_now_playing_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_popular_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_similar_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_top_rated_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_upcoming_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/get_video_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/save_movie_to_local.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/search_movie.dart';
import 'package:hnk_movie/src/features/movie/domain/usecases/search_person.dart';

// app
final appRepositoryProvider = Provider<AppRepository>((ref) {
  final LanguageLocalDataSource languageLocalDataSource =
      LanguageLocalDataSourceImpl();
  final app = AppRepositoryImpl(languageLocalDataSource);
  return app;
});

// auth
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSourceImpl();
  final auth = AuthRepositoryImpl(authRemoteDataSource);
  ref.onDispose(() => auth.dispose());
  return auth;
});

final authStateChangesProvider =
    StreamProvider.autoDispose<UserInfomation?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});

final loginProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return LoginUseCase(repository);
});

final logOutProvider = Provider<LogOutUsecase>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return LogOutUsecase(repository);
});
final signInWithGoogleProvider = Provider<SignInWithGoogleUsecase>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return SignInWithGoogleUsecase(repository);
});
final signUpProvider = Provider<SignUpUsecase>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return SignUpUsecase(repository);
});

// movie
final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  Dio dio = Dio();
  // dio.interceptors.add(PrettyDioLogger());
  dio.interceptors.add(TimeoutInterceptor(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
  ));
  final MovieApiService movieRemoteDataSource = MovieApiService(dio);
  final MovieLocalDataSource movieLocalDataSource = MovieLocalDataSourceImpl();
  return MovieRepositoryImpl(movieRemoteDataSource, movieLocalDataSource);
});

final getNowPlayingMoviesProvider = Provider<GetNowPlayingMoviesUseCase>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return GetNowPlayingMoviesUseCase(repository);
});

final getTopRatedMoviesProvider = Provider<GetTopRatedMoviesUseCase>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return GetTopRatedMoviesUseCase(repository);
});
final getPopularMoviesProvider = Provider<GetPopularMoviesUseCase>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return GetPopularMoviesUseCase(repository);
});
final getUpcomingMoviesProvider = Provider<GetUpcomingMoviesUseCase>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return GetUpcomingMoviesUseCase(repository);
});
final getSimilarMoviesProvider = Provider<GetSimilarMoviesUseCase>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return GetSimilarMoviesUseCase(repository);
});
final getDetailMovieProvider = Provider<GetDetailMovieUseCase>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return GetDetailMovieUseCase(repository);
});
final getCreditsMovieProvider = Provider<GetCreditsMovieUseCase>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return GetCreditsMovieUseCase(repository);
});
final getVideosMovieProvider = Provider<GetVideosMovieUseCase>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return GetVideosMovieUseCase(repository);
});
final getDetailPersonProvider = Provider<GetDetailPersonUseCase>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return GetDetailPersonUseCase(repository);
});
final getImagesPersonProvider = Provider<GetImagesPersonUseCase>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return GetImagesPersonUseCase(repository);
});
final getMovieCreditsPersonProvider =
    Provider<GetMovieCreditsPersonUseCase>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return GetMovieCreditsPersonUseCase(repository);
});
final searchMovieProvider = Provider<SearchMovieUseCase>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return SearchMovieUseCase(repository);
});
final searchPersonProvider = Provider<SearchPersonUseCase>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return SearchPersonUseCase(repository);
});

final saveMovieToLocalProvider = Provider<SaveMovieToLocalUsecase>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return SaveMovieToLocalUsecase(repository);
});
final checkMovieIsFavoriteProvider =
    Provider<CheckMovieIsFavoriteUsecase>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return CheckMovieIsFavoriteUsecase(repository);
});
final deleteMovieProvider = Provider<DeleteMovieUsecase>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return DeleteMovieUsecase(repository);
});
final getMoviesFromLocalProvider = Provider<GetMoviesFromLocalUsecase>((ref) {
  final repository = ref.read(movieRepositoryProvider);
  return GetMoviesFromLocalUsecase(repository);
});
