import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/features/auth/data/data_transfer_objects/user_dto.dart';
import 'package:flutter_template/features/auth/data/data_transfer_objects/user_login_response_dto.dart';
import 'package:flutter_template/features/auth/domain/params/login_params.dart';

abstract interface class AuthRemoteDataSource {

  Future<DataState<UserLoginResponseDTO>> login({required LoginParams params});
  Future<DataState<UserDTO>> userMe();
  
}