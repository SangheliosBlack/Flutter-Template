

import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_template/features/auth/domain/params/login_params.dart';


abstract class AuthRepository {

  Future<DataState<UserEntity>> login({required LoginParams params});
  Future<DataState<UserEntity>> loadUser();

}