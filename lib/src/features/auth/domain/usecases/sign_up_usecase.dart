import 'package:hnk_movie/src/core/exceptions/firebase_auth_exception.dart';
import 'package:hnk_movie/src/features/auth/domain/entities/sign_up.dart';
import 'package:hnk_movie/src/features/auth/domain/repositories/auth_repo.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';

class SignUpUsecase
    implements UseCaseRemote<void, HFirebaseAuthException, SignUp> {
  final AuthRepository _authRepository;

  SignUpUsecase(this._authRepository);

  @override
  Future<DataState<void, HFirebaseAuthException>> call({SignUp? params}) async {
    return await _authRepository.signUp(params!);
  }
}
