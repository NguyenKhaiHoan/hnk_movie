import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/di/di.dart';
import 'package:hnk_movie/src/features/auth/domain/entities/login.dart';
import 'package:hnk_movie/src/features/auth/domain/entities/sign_up.dart';
import 'package:hnk_movie/src/features/auth/domain/usecases/log_out_usecase.dart';
import 'package:hnk_movie/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:hnk_movie/src/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:hnk_movie/src/features/auth/domain/usecases/sign_up_usecase.dart';

final authenticationControllerProvider =
    StateNotifierProvider<AuthenticationController, AsyncValue<void>>((ref) {
  final loginUsecase = ref.read(loginProvider);
  final logOutUsecase = ref.read(logOutProvider);
  final signUpUsecase = ref.read(signUpProvider);
  final signInWithGoogleUsecase = ref.read(signInWithGoogleProvider);
  return AuthenticationController(
      logOutUsecase: logOutUsecase,
      loginUseCase: loginUsecase,
      signInWithGoogleUsecase: signInWithGoogleUsecase,
      signUpUsecase: signUpUsecase);
});

class AuthenticationController extends StateNotifier<AsyncValue<void>> {
  AuthenticationController(
      {required this.loginUseCase,
      required this.logOutUsecase,
      required this.signUpUsecase,
      required this.signInWithGoogleUsecase})
      : super(const AsyncValue.data(null));

  LoginUseCase loginUseCase;
  LogOutUsecase logOutUsecase;
  SignUpUsecase signUpUsecase;
  SignInWithGoogleUsecase signInWithGoogleUsecase;

  Future<void> login(Login login) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => loginUseCase.call(params: login));
  }

  Future<void> logout(WidgetRef ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => logOutUsecase.call());
  }

  Future<void> signUp(SignUp signUp) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => signUpUsecase.call(params: signUp));
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => signInWithGoogleUsecase.call());
  }
}
