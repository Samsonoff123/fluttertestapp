import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('Запрос: ${options.method} ${options.uri}');
    options.headers['Authorization'] = 'Bearer your_access_token';
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Ответ: ${response.statusCode} ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('Ошибка: ${err.message}');
    handler.next(err);
  }
}
