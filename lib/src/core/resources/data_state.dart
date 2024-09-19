
sealed class DataState<S, E extends Exception> {
  final S? data;
  final E? exception;
  const DataState({this.data, this.exception});
}

final class DataSuccess<S, E extends Exception> extends DataState<S, E> {
  const DataSuccess(S data) : super(data: data);
}

final class DataFailed<S, E extends Exception> extends DataState<S, E> {
  const DataFailed(E exception) : super(exception: exception);
}
