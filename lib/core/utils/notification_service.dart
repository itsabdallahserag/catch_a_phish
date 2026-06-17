import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final notifications = FlutterLocalNotificationsPlugin();
  static Future<void> init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = DarwinInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: iOS);
    await notifications.initialize(settings: settings);
    await notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  static Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    const android = AndroidNotificationDetails(
      'phishing_channel', // id القناة
      'Phishing Alerts', // اسم القناة
      importance: Importance.high,
      priority: Priority.high,
    );
    const details = NotificationDetails(android: android);
    await notifications.show(
      id: 0,
      title: title,
      body: body,
      notificationDetails: details,
    );
  }

  // هنا هتحط الـ instance
  // هنا هتحط init()
  // هنا هتحط showNotification()
}
