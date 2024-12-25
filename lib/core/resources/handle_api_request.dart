import 'package:dio/dio.dart';
import 'package:flutter_template/core/constants/app_constants.dart';
import 'package:flutter_template/core/utils/errors/datasource_exception.dart';

Future<T> handleApiRequest<T>(Future<T> Function() request) async {

  try {

    return await request();

  } on DioException catch (dioError) {

    final message = dioError.message ?? "";

    if (dioError.response?.statusCode == 401) {
      throw ServerException(
        message: AppConstants.dioNotAuthorized,
        statusCode: 401,
        originalError: dioError,
      );
    }

    if (dioError.type == DioExceptionType.connectionTimeout) {

      throw NetworkException(
        message: AppConstants.dioExceptionTimeOut,
        originalError: dioError,
        statusCode: 408,
      );

    } else if (dioError.type == DioExceptionType.badResponse) {

      final statusCode = dioError.response?.statusCode;

      throw ServerException(
        message: '${AppConstants.dioExceptionHTTPError} $statusCode. ${dioError.response?.data}',
        statusCode: statusCode ?? 0,
        originalError: dioError,
      );

    } else if (dioError.type == DioExceptionType.unknown) {

      throw NetworkException(
        message: AppConstants.dioExceptionNoInternetConnection,
        originalError: dioError,
      );

    } else {

      throw UnknownException(
        message: message,
        originalError: dioError,
        statusCode: 401,
      );

    }

  } catch (e) {

    throw UnknownException(
      message: '${AppConstants.unknowErrorMessage}: $e',
      originalError: e,
      statusCode: 500,
    );

  }

}
