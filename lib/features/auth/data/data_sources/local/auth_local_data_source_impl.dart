import 'package:dio/dio.dart';
import 'package:flutter_template/core/resources/data_state.dart';

import 'package:flutter_template/features/auth/data/data_sources/data_sources.dart';
import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';


class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  
  final LocalStorageServiceImpl localStorageService;

  AuthLocalDataSourceImpl({required this.localStorageService});
  
  @override
  Future<void> saveToken({required String token}) async {

    await localStorageService.setValue(key: LocalStorageKeys.ACCESS_TOKEN, value: token);

  }

  @override
  Future <DataState<UserEntity>>? getCachedUser() async {
    
    final UserEntity? userEntity =  await CacheServiceImpl().getData(key: HiveBoxConstants.saveUser);

    if(userEntity != null){

      return DataSuccess(userEntity);
      
    }else{

      final error =  DioException(requestOptions: RequestOptions(path: ''),message: "Expired User Entity TTL");

      return DataFailed(error);

    }

  }

  @override
  Future<void> saveUser(UserEntity userData) async {
    
    await CacheServiceImpl().storeData(key: HiveBoxConstants.saveUser, data: userData);

    return;

  }

}
