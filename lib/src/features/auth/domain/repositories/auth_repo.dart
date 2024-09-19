import 'package:flutter/cupertino.dart';
import 'package:hnk_movie/src/core/exceptions/firebase_auth_exception.dart';
import 'package:hnk_movie/src/core/resources/data_state.dart';
import 'package:hnk_movie/src/features/auth/domain/entities/login.dart';
import 'package:hnk_movie/src/features/auth/domain/entities/sign_up.dart';
import 'package:hnk_movie/src/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Stream<UserInfomation?> authStateChanges();
  UserInfomation? get currentUser;

  Future<DataState<void, HFirebaseAuthException>> login(Login login);
  Future<DataState<void, HFirebaseAuthException>> signUp(SignUp signUp);
  Future<DataState<void, HFirebaseAuthException>> logOut();
  Future<DataState<void, HFirebaseAuthException>> signInWithGoogle();

  Future<void> screenRedirect(BuildContext context);
  void dispose();
}
