import 'package:hnk_movie/src/core/exceptions/firebase_auth_exception.dart';
import 'package:hnk_movie/src/features/auth/domain/entities/login.dart';
import 'package:hnk_movie/src/features/auth/domain/repositories/auth_repo.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';

class LoginUseCase
    implements UseCaseRemote<void, HFirebaseAuthException, Login> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<DataState<void, HFirebaseAuthException>> call({Login? params}) async {
    return await _authRepository.login(params!);
  }
}
