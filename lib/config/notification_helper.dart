import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static final NotificationHelper _notificationHelper =
      NotificationHelper._internal();
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final NotificationDetails _androidNotification = const NotificationDetails(
      android: AndroidNotificationDetails(
          "channel id", "channel name", "channel description",
          importance: Importance.max));

  factory NotificationHelper() {
    return _notificationHelper;
  }

  NotificationHelper._internal();

  Future<void> onInit() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("flag");//caso a imagem não seja passada ou ela não exista, o aplicativo não funcionará
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid, macOS: null, iOS: null);
    await NotificationHelper._notificationsPlugin.initialize(
        initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future selectNotification(String? payload) async {}

  Future showNotification(
          {int id = 0, String? title, String? body, String? payload}) async =>
      _notificationsPlugin.show(id, title, body, _androidNotification);
}
