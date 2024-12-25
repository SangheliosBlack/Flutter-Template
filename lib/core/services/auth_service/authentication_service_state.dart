enum AuthenticationStatus{
  checking,
  authenticated,
  notAuthenticated
}

class AuthenticationServiceState{

  final AuthenticationStatus status;
  final String? token;

  AuthenticationServiceState({required this.status, this.token});

  AuthenticationServiceState copyWith({AuthenticationStatus? status, String? token}){
    return AuthenticationServiceState(
      status: status ?? this.status,
      token: token ?? this.token
    );
  }

}