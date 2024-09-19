import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hnk_movie/src/core/exceptions/firebase_auth_exception.dart';
import 'package:hnk_movie/src/features/auth/domain/entities/login.dart';
import 'package:hnk_movie/src/features/auth/domain/entities/sign_up.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> signUp(SignUp signUp);
  Future<UserCredential> login(Login signIn);
  Future<UserCredential> signInWithGoogle();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserCredential> login(Login login) async {
    try {
      FirebaseAuth firebaseInstance = FirebaseAuth.instance;
      await firebaseInstance.currentUser?.reload();
      return await firebaseInstance.signInWithEmailAndPassword(
        email: login.email,
        password: login.password,
      );
    } on HFirebaseAuthException catch (e) {
      throw HFirebaseAuthException(code: e.code).message;
    }
  }

  @override
  Future<UserCredential> signUp(SignUp signUp) async {
    try {
      FirebaseAuth firebaseInstance = FirebaseAuth.instance;
      await firebaseInstance.currentUser?.reload();
      return await firebaseInstance.createUserWithEmailAndPassword(
        email: signUp.email,
        password: signUp.password,
      );
    } on HFirebaseAuthException catch (e) {
      throw HFirebaseAuthException(code: e.code).message;
    }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    FirebaseAuth firebaseInstance = FirebaseAuth.instance;
    await firebaseInstance.currentUser?.reload();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      return await firebaseInstance.signInWithCredential(credential);
    } on HFirebaseAuthException catch (e) {
      throw HFirebaseAuthException(code: e.code).message;
    }
  }
}
