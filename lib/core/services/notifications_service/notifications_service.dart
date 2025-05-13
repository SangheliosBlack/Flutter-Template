// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_template/core/services/notifications_service/i_notifications_service.dart';

class NotificationService implements INotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  Future<String?> requestPermission() async {

    final settings = await _firebaseMessaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {

      print('🔓 Permisos de notificación otorgados');

      final fcmToken = await getFcmToken();

      return fcmToken;

    } else {

      print('❌ Permisos de notificación denegados');

      return null;

    }

  }

  @override
  Future<String?> getFcmToken() async {

    try {

      final token = await _firebaseMessaging.getToken();

      print('📲 Token FCM obtenido: $token');

      return token;

    } catch (e) {

      print('⚠️ Error al obtener el token FCM: $e');

      return null;

    }

  }

  @override
  void listenToForegroundMessages() {

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {

      final title = message.notification?.title;

      final body = message.notification?.body;

      print('📥 Notificación recibida en primer plano: $title - $body');
      
    });

  }
  
}
