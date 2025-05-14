import 'package:flutter/material.dart';
import 'package:flutter_notification/screen/notification_screen.dart';
import 'package:flutter_notification/service/notification_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();
  tz.initializeTimeZones();
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
