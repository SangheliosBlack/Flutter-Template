import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/features/auth/domain/entities/login_user_response_entiti.dart';
import 'package:flutter_template/features/auth/domain/params/login_params.dart';

abstract interface class AuthRemoteDataSource {

  Future<DataState<LoginUserEntity>> login({required LoginParams params});
  
}