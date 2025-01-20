import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/usecase/usecase.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_template/features/auth/domain/params/login_params.dart';
import '../domain.dart';

class LoginUseCase implements Usecase<DataState<UserEntity>, LoginParams> {
  
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<DataState<UserEntity>> execute({required LoginParams params}) {

    return _authRepository.login(
      params: params
    );
    
  }
}
