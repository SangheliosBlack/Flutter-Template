import 'package:flutter/foundation.dart';
import 'package:flutter_template/config/config.dart';
import 'package:flutter_template/services/http_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

/*
Para usarlo en cualquier parte de tu codigo
final socketService = Provider.of<SocketService>(context);
socketService.connect();*/

enum ServerStatus { online, offline, connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  late io.Socket _socket;
  final HttpService httpService;
  final Developer developer;

  SocketService({required this.developer, required this.httpService});

  ServerStatus get serverStatus => _serverStatus;

  io.Socket get socket => _socket;
  Function get emit => _socket.emit;

  void connect() async {
    try {
      final url = developer.apiUrl();

      _socket = io.io(url, {
        'transports': ['websocket'],
        'autoConnect': true,
        'forceNew': true,
        'extraHeaders': {'Authorization': 'Bearer ${httpService.token}'}
      });

      _socket.onConnect((_) {
        _serverStatus = ServerStatus.online;
        notifyListeners();
        _socket.emit('mensaje', "Hola desde Flutter");
      });

      _socket.onDisconnect((_) {
        _serverStatus = ServerStatus.offline;
        notifyListeners();
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error de conexión: $e');
      }
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    }
  }

  void disconnect() {
    try {
      _socket.disconnect();
    } catch (e) {
      // Manejar el error (puedes notificar al usuario o realizar otras acciones)
      if (kDebugMode) {
        print('Error al desconectar el socket: $e');
      }
    }
  }
}
