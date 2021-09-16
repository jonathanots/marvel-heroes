import 'package:dio/dio.dart';

/// This Class [TrackInterceptor] is a tracking interceptor for requests.
/// Use this interceptor to get some details about your requests.
class TrackInterceptor implements InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("REQUEST[${options.method}] => PATH: ${options.path}");
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("ERROR[${err.response!.statusCode}] => PATH: ${err.requestOptions.path}");
    handler.reject(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}");
    handler.resolve(response);
  }
}
