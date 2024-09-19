import 'package:hnk_movie/src/core/resources/data_state.dart';

abstract class UseCaseRemote<S, E extends Exception, Params> {
  Future<DataState<S, E>> call({Params params});
}

abstract class UseCaseLocal<S, Params> {
  Future<S> call({Params params});
}
