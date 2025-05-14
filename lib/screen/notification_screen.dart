import 'package:flutter/material.dart';

import '../service/notification_service.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    NotificationService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                NotificationService.showNotification(
                  title: 'Hello Rahul!',
                  body: 'This is your working notification!',
                );
              },
              child: Text('Show Notification'),
            ),
            ElevatedButton(
              onPressed: () async {
                final scheduledTime = DateTime.now().add(Duration(seconds: 10));
                await NotificationService.scheduleNotification(
                  title: 'Scheduled Notification',
                  body: 'This was scheduled 10 seconds ago',
                  scheduledDateTime: scheduledTime,
                );
              },
              child: Text("Schedule Notification (after 10 sec)"),
            ),
          ],
        ),
      ),
    );
  }
}
