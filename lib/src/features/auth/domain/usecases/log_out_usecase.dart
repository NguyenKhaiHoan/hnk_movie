import 'package:hnk_movie/src/core/exceptions/firebase_auth_exception.dart';
import 'package:hnk_movie/src/features/auth/domain/repositories/auth_repo.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';

class LogOutUsecase
    implements UseCaseRemote<void, HFirebaseAuthException, void> {
  final AuthRepository _authRepository;

  LogOutUsecase(this._authRepository);

  @override
  Future<DataState<void, HFirebaseAuthException>> call({void params}) async {
    return await _authRepository.logOut();
  }
}
