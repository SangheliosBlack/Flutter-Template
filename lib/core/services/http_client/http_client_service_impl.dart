import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/utils/errors/datasource_exception.dart';
import 'package:flutter_template/core/constants/environments.dart';
import 'package:flutter_template/core/resources/handle_api_request.dart';

import '../local_storage/local_storage_service.dart';
import 'http_client.dart';

class HttpClientServiceImpl extends HttpClientService {

  late final Dio _dio;

  final Ref<HttpClientService> ref;

  final LocalStorageService localStorageService;

  HttpClientServiceImpl({required this.localStorageService, required this.ref}) {
    
    _dio = Dio(
      BaseOptions(baseUrl: '${Environments.PATH_URL}/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}'),
    );

    _dio.interceptors.clear();
    _dio.interceptors.add(HttpClientInterceptor(localStorageService: localStorageService));
    
    /*
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
    */

  } 

  @override
  Future post({required String path, Map<String, dynamic>? data}) async {

  return handleApiRequest(() async {
      return await _dio.post(path, data: data);
    });
  }

  @override
  Future get({required String path}) async {

    try {

      final Response<dynamic>  response = await _dio.get(path);

      return response;

    } on DioException catch (e) {

      throw NetworkException(message: e.response?.statusMessage ?? "", statusCode: e.response!.statusCode ?? 0);

    }

  }

  @override
  Future delete({required String path}) async {

    try {

      final Response<dynamic>  response = await _dio.delete(path);

      return response;

    } on DioException catch (e) {

      throw NetworkException(message: e.response?.statusMessage ?? "", statusCode: e.response!.statusCode ?? 0);

    }

  }

  @override
  Future put({required String path, required Map<String, dynamic> data}) async {

    try {

      final Response<dynamic>  response = await _dio.put(path, data: data);

      return response;

    } on DioException catch (e) {

      throw NetworkException(message: e.response?.statusMessage ?? "", statusCode: e.response!.statusCode?? 0);

    }
    
  }

}
