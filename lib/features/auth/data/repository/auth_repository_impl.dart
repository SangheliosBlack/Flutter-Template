import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/features/auth/data/datasources/data_sources.dart';
import 'package:flutter_template/features/auth/domain/domain.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_template/features/auth/domain/params/login_params.dart';

class AuthRepositoryImpl implements AuthRepository {

  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource
  });

  @override
  Future<DataState<UserEntity>> login({required LoginParams params}) async {

    final remoteResponse = await remoteDataSource.login(params: params);

    if(remoteResponse is DataSuccess){

      await localDataSource.saveToken(token: remoteResponse.data!.accessToken);

      return DataSuccess(remoteResponse.data!.user);

    }
    
    return DataFailed(remoteResponse.error!);
    
  }

}