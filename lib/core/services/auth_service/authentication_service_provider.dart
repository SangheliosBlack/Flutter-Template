import 'package:flutter_template/core/constants/local_storage_keys.dart';
import 'package:flutter_template/core/services/auth_service/authentication_service_state.dart';
import 'package:flutter_template/core/services/local_storage/local_storage_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_service_provider.g.dart';

@riverpod
class AuthenticationServiceNotifier extends _$AuthenticationServiceNotifier {

  late LocalStorageServiceImpl _localStorage;

   @override
  AuthenticationServiceState build() {

    _localStorage = LocalStorageServiceImpl();

    return AuthenticationServiceState(status: AuthenticationStatus.checking);

  }

  Future<AuthenticationStatus> checkAuthenticationStatus() async {

    final isAuthenticated = await _localStorage.getValue(key: LocalStorageKeys.ACCESS_TOKEN);

    if (isAuthenticated != null && isAuthenticated.isNotEmpty) {

      state = state.copyWith(status: AuthenticationStatus.authenticated, token: isAuthenticated);

      return AuthenticationStatus.authenticated;

    } else {

      state = state.copyWith(status: AuthenticationStatus.notAuthenticated);

      return AuthenticationStatus.notAuthenticated;

    }

  }

  Future<void> authenticate(String token) async {

    await _localStorage.setValue(
      key: LocalStorageKeys.ACCESS_TOKEN, 
      value: token
    );
    
    state = state.copyWith(status: AuthenticationStatus.authenticated, token: token);

  }

  Future<void> logout() async {

    await _localStorage.deleteValue(key: LocalStorageKeys.ACCESS_TOKEN);
    
    state = state.copyWith(status: AuthenticationStatus.notAuthenticated, token: null);
    
  }
}