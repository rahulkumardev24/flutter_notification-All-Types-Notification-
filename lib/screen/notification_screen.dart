import 'package:flutter/material.dart';

import '../service/notification_service.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Notification Screen'),
            ElevatedButton(
              onPressed: () {
                NotificationService.showNotification(
                  title: 'Hello Rahul!',
                  body: 'This is your working notification!',
                );
              },
              child: Text('Show Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
