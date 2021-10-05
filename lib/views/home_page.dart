import 'package:flutter/material.dart';
import 'package:flutter_notifications/config/notification_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getHeaderHomePage(),
      body: _getBody(),
    );
  }

  _getHeaderHomePage() {
    return AppBar(
      title: const Text("Notifications Test"),
    );
  }

  _getBody() {
    return Center(
      child: TextButton(
        child: const Text("Exibir Notificação"),
        onPressed: () {
          NotificationHelper().showNotification(
              title: "Notificação Local",
              body: "Notificação local em primeiro plano",
              payload: "valor passado de fato para minha api");
        },
      ),
    );
  }
}
