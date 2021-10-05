import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notifications/config/notification_helper.dart';
import 'package:flutter_notifications/views/home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if(AppLifecycleState != AppLifecycleState.resumed) {
      NotificationHelper().showNotification(
          title: "Notificação Local",
          body: "Esta é uma notificação em segundo plano",
          payload: "dado passado para a api"
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
