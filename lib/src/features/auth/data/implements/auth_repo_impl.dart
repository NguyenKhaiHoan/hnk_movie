// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hnk_movie/src/core/exceptions/firebase_auth_exception.dart';
import 'package:hnk_movie/src/core/resources/data_state.dart';
import 'package:hnk_movie/src/core/services/in_memory_store_service.dart';
import 'package:hnk_movie/src/core/services/local_service.dart';
import 'package:hnk_movie/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:hnk_movie/src/features/auth/domain/entities/login.dart';
import 'package:hnk_movie/src/features/auth/domain/entities/sign_up.dart';
import 'package:hnk_movie/src/features/auth/domain/entities/user.dart';
import 'package:hnk_movie/src/features/auth/domain/repositories/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);
  final _authFirebase = FirebaseAuth.instance;

  final _authState = HInMemoryStoreService<UserInfomation?>(null);

  @override
  Stream<UserInfomation?> authStateChanges() => _authState.stream;

  @override
  UserInfomation? get currentUser => _authState.value;

  @override
  Future<DataState<void, HFirebaseAuthException>> login(Login login) async {
    try {
      final userCredential = await _authRemoteDataSource.login(login);
      _authState.value = UserInfomation(
          id: userCredential.user!.uid,
          name: userCredential.user!.displayName,
          urlToImage: userCredential.user!.photoURL ??
              'https://img2.woyaogexing.com/2023/10/11/3c73d2ea0853916b69a2c4f08e7e2387.jpg',
          email: userCredential.user!.email);
      await HLocalService.initializeStorage(userCredential.user!.uid);
      return const DataSuccess(null);
    } on HFirebaseAuthException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<void, HFirebaseAuthException>> logOut() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      _authState.value = null;
      return const DataSuccess(null);
    } on HFirebaseAuthException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<void, HFirebaseAuthException>> signInWithGoogle() async {
    try {
      final userCredential = await _authRemoteDataSource.signInWithGoogle();
      _authState.value = UserInfomation(
          id: userCredential.user!.uid,
          name: userCredential.user!.displayName,
          urlToImage: userCredential.user!.photoURL ??
              'https://img2.woyaogexing.com/2023/10/11/3c73d2ea0853916b69a2c4f08e7e2387.jpg',
          email: userCredential.user!.email);
      await HLocalService.initializeStorage(userCredential.user!.uid);
      return const DataSuccess(null);
    } on HFirebaseAuthException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  void dispose() => _authState.close();

  @override
  Future<DataState<void, HFirebaseAuthException>> signUp(SignUp signUp) async {
    if (signUp.password != signUp.repeatedPassword) {
      return DataFailed(HFirebaseAuthException(code: 'password-mismatch'));
    } else {
      try {
        final signUpModel = SignUp(
            name: signUp.name,
            email: signUp.email,
            password: signUp.password,
            repeatedPassword: signUp.repeatedPassword);
        final userCredential = await _authRemoteDataSource.signUp(signUpModel);
        _authState.value = UserInfomation(
            id: userCredential.user!.uid,
            name: userCredential.user!.displayName,
            urlToImage: userCredential.user!.photoURL ??
                'https://img2.woyaogexing.com/2023/10/11/3c73d2ea0853916b69a2c4f08e7e2387.jpg',
            email: userCredential.user!.email);
        await HLocalService.initializeStorage(userCredential.user!.uid);
        return const DataSuccess(null);
      } on HFirebaseAuthException catch (exception) {
        return DataFailed(exception);
      }
    }
  }

  @override
  Future<void> screenRedirect(BuildContext context) async {
    final user = _authFirebase.currentUser;
    if (user != null) {
      _authState.value = UserInfomation(
          id: _authFirebase.currentUser!.uid,
          name: _authFirebase.currentUser!.displayName,
          urlToImage: _authFirebase.currentUser!.photoURL ??
              'https://img2.woyaogexing.com/2023/10/11/3c73d2ea0853916b69a2c4f08e7e2387.jpg',
          email: _authFirebase.currentUser!.email);
      SchedulerBinding.instance.addPostFrameCallback((_) async {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/base', (Route<dynamic> route) => false);
      });
      await HLocalService.initializeStorage(_authFirebase.currentUser!.uid);
    } else {
      SchedulerBinding.instance.addPostFrameCallback((_) async {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/welcome', (Route<dynamic> route) => false);
      });
    }
  }
}
