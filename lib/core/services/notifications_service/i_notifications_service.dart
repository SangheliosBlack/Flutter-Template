abstract class INotificationService {
  Future<String?> requestPermission();
  Future<String?> getFcmToken();
  void listenToForegroundMessages();
}
