abstract class HttpClientService {

  Future<dynamic> get({required String path});

  Future<dynamic> delete({required String path});

  Future<dynamic> put({required String path, required Map<String, dynamic> data});

  Future<dynamic> post({required String path, Map<String, dynamic>? data});
  
}
