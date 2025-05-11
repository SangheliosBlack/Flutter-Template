import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_template/features/auth/domain/repository/auth_repository.dart';

class LoadUserCase {

  final AuthRepository _authRepository;

  LoadUserCase(this._authRepository);
  
  Future<DataState<UserEntity>> execute() async {
    
    return  _authRepository.loadUser();
    
  }
 
}
