import 'package:dio/dio.dart';
import 'package:flutter_template/core/resources/api_response.dart';
import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/services/http_client/http_client_service_impl.dart';
import 'package:flutter_template/core/utils/errors/datasource_exception.dart';
import 'package:flutter_template/core/utils/utils.dart';
import 'package:flutter_template/features/auth/data/data_transfer_objects/user_dto.dart';
import 'package:flutter_template/features/auth/data/data_transfer_objects/user_login_response_dto.dart';
import 'package:flutter_template/features/auth/domain/params/login_params.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {

  final HttpClientServiceImpl httpClientService;

  AuthRemoteDataSourceImpl({required this.httpClientService});

  @override
  Future<DataState<UserLoginResponseDTO>> login({required LoginParams params}) async {

    try {

        final response = await httpClientService.post(
          path: '/auth/login',
          data: {
            'email': params.email,
            'password': params.password,
          },
        );

        if(response.statusCode == 200){
          
          final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);

          final userLoginResponseDTO = UserLoginResponseDTO.fromJson(apiResponse.data!);

          return DataSuccess(userLoginResponseDTO);

        }else{

          return DataFailed(DioException(
            message: "The server returned an empty response. This could be due to an issue with the server or a timeout. Please try again later.",
            requestOptions: RequestOptions(
              path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/auth/login',
            ),
          ));

        }

    
    } on NetworkException catch (e) {

      return DataFailed(DioException(
        message: e.message,
        requestOptions: RequestOptions(
          path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/auth/login',
        ),
      ));

    }
    
  }


  @override
  Future<DataState<UserDTO>> userMe() async {
  
    try {

      final response = await httpClientService.get(path: '/user');

      if(response.statusCode == 200){

        final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);

        final userLoginResponseDTO = UserDTO.fromJson(apiResponse.data!);

        return DataSuccess(userLoginResponseDTO);

      }else{

        return DataFailed(DioException(
          message: "The server returned an empty response. This could be due to an issue with the server or a timeout. Please try again later.",
          requestOptions: RequestOptions(
            path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/auth/login',
          ),
        ));

      }
    
    } on NetworkException catch (e) {

      return DataFailed(DioException(
        message: e.message,
        requestOptions: RequestOptions(
          path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/auth/login',
        ),
      ));

    }

  }
  
}
