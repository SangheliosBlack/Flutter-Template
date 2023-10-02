import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:skeleton/config/config.dart';
import 'package:skeleton/config/load_certificate.dart';
import 'package:skeleton/services/local_storage.dart';


class HttpService {
  final apiPath = Developer().apiUrl();

  late String token;

  HttpService() {
    token = LocalStorage.prefs.getString('token') ?? "";
  }

  void actualizarToken(String nuevoToken) {
    token = nuevoToken;
    LocalStorage.prefs.setString('token', nuevoToken);
  }
  void eliminarToken(){
    LocalStorage.prefs.remove("token");
  }

  Map<String, String> _headers() {
    return {HttpHeaders.authorizationHeader: "Bearer $token"};
  }

  Future<http.Response> post({required String path,required  Object? data}) async {

    String jsonData = jsonEncode(data);
    HttpClient httpClient = HttpClient();
    SecurityContext securityContext = SecurityContext.defaultContext;

    securityContext.setTrustedCertificatesBytes(await loadCertificate());

    HttpClientRequest request = await httpClient.postUrl(Uri.parse(apiPath + path),);
    
    
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.headers.set(HttpHeaders.authorizationHeader, "Bearer $token");
    
    request.write(jsonData);

    HttpClientResponse response = await request.close();

    String responseBody = await response.transform(utf8.decoder).join();
    return http.Response(responseBody, response.statusCode);
  }


  Future<http.Response> get({required String path}) async {
    HttpClient httpClient = HttpClient();
    SecurityContext securityContext = SecurityContext.defaultContext;

    securityContext.setTrustedCertificatesBytes(await loadCertificate());

    HttpClientRequest request = await httpClient.getUrl(Uri.parse(apiPath + path),);
    
    
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.headers.set(HttpHeaders.authorizationHeader, "Bearer $token");
    

    HttpClientResponse response = await request.close();

    String responseBody = await response.transform(utf8.decoder).join();
    return http.Response(responseBody, response.statusCode);
  }

  Future<http.Response> patch({required String path, Object? data}) async {
    return await http.patch(Uri.parse(apiPath + path),
        headers: _headers(), body: data);
  }

  Future<http.Response> update({required String path, Object? data}) async {
    return await http.post(Uri.parse(apiPath + path),
        headers: _headers(), body: data);
  }

  Future<http.Response> delete({required String path, Object? data}) async {
    return await http.post(Uri.parse(apiPath + path),
        headers: _headers(), body: data);
  }
}
