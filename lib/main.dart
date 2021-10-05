import 'package:flutter/material.dart';
import 'package:flutter_notifications/config/my_app.dart';
import 'package:flutter_notifications/config/notification_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationHelper().onInit();
  runApp(const MyApp());
}
