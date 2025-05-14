import 'package:flutter/material.dart';
import 'package:flutter_notification/screen/notification_screen.dart';
import 'package:flutter_notification/service/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Notification Demo',
      home: NotificationScreen(),
    );
  }
}

