import 'package:dio/dio.dart';
import 'package:marvel_heroes/shared/clients/client_interface.dart';

class DioClientImpl implements IClient {
  late Dio _dio;
  final String queryAuth;

  DioClientImpl({required String baseUrl, this.queryAuth = '', List<InterceptorsWrapper>? interceptors}) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl, contentType: 'application/json', validateStatus: (status) => status! < 500));

    _setupInterceptors(interceptors: interceptors);
  }

  /// Setting up the DioClient with some [interceptors]
  _setupInterceptors({required List<InterceptorsWrapper>? interceptors}) {
    if (interceptors == null) return;

    _dio.interceptors.clear();

    for (InterceptorsWrapper interceptor in interceptors) {
      _dio.interceptors.add(interceptor);
    }
  }

  @override
  Future get(String? uri, {String? query = '', Map<String, dynamic>? headers = const {}}) async {
    return await _dio.get(uri! + queryAuth + query!);
  }

  @override
  Future post(String? uri, {dynamic data = '', String? query = '', Map<String, dynamic>? headers = const {}}) async {
    // return await _dio.post(uri! + queryAuth + query!, data: data!);
    throw UnimplementedError('This method was not implemented yet.');
  }

  @override
  Future update(String? uri, {dynamic data = '', String? query = '', Map<String, dynamic>? headers = const {}}) async {
    // return await _dio.put(uri! + queryAuth + query!, data: data!);
    throw UnimplementedError('This method was not implemented yet.');
  }

  @override
  Future delete(String? uri, {dynamic data = '', String? query = '', Map<String, dynamic>? headers = const {}}) async {
    // return await _dio.delete(uri! + queryAuth + query!, data: data!);
    throw UnimplementedError('This method was not implemented yet.');
  }
}
