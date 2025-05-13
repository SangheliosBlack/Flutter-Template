import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/features/auth/data/data_sources/data_sources.dart';
import 'package:flutter_template/features/auth/data/mappers/login_user_response_mapper.dart';
import 'package:flutter_template/features/auth/data/mappers/user_mapper_response.dart';
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

      final responseToEntity = LoginUserResponseMapper.toLoginUserEntity(remoteResponse.data!);

      await localDataSource.saveToken(token: responseToEntity.accessToken);

      await localDataSource.saveUser(responseToEntity.user);

      return DataSuccess(responseToEntity.user);

    }
    
    return DataFailed(remoteResponse.error!);
    
  }

   @override
  Future<DataState<UserEntity>> loadLocalUser() async {

    final localResponse = await localDataSource.getCachedUser();

    if(localResponse is DataSuccess){

      return DataSuccess(localResponse!.data!);

    }else{

      final remoteResponse = await remoteDataSource.userMe();

      final userEntity = UserMapper.toEntity(remoteResponse.data!);

      await localDataSource.saveUser(userEntity);

      return DataSuccess(userEntity);

    }

  }
  
  @override
  Future<DataState<UserEntity>> updateFcmToken({required String fcmToken}) async {

    final remoteResponse = await remoteDataSource.updateFcmToken(fcmToken: fcmToken);

    if(remoteResponse is DataSuccess){

    final userEntity = UserMapper.toEntity(remoteResponse.data!);

      await localDataSource.saveUser(userEntity);

      return DataSuccess(userEntity);

    }else{

      return DataFailed(remoteResponse.error!);

    }

  }

}