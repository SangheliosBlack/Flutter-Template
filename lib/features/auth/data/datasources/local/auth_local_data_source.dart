abstract interface class AuthLocalDataSource {
  
  Future<void> saveToken({required String token});
  
}