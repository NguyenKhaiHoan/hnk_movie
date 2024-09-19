import 'package:dio/dio.dart';

class TimeoutInterceptor extends Interceptor {
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final Duration sendTimeout;

  TimeoutInterceptor({
    required this.connectTimeout,
    required this.receiveTimeout,
    required this.sendTimeout,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.connectTimeout = connectTimeout;
    options.receiveTimeout = receiveTimeout;
    options.sendTimeout = sendTimeout;
    super.onRequest(options, handler);
  }
}
