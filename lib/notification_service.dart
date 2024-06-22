import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher'); // Double-check path

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _notificationsPlugin.initialize(
      initializationSettings,
    );
  }

  static Future<void> showNotification() async {
    print('showing notification');


    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'channel_id', // Replace with your desired channel ID
      'Your Channel Name',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    // Consider adding a slight delay for iOS:
    // await _notificationsPlugin.show(
    //   0,
    //   'title',
    //   'Welcome to our fantasy app',
    //   platformDetails,
    //   payload: 'Default_Sound',
    //   scheduledDeliveryTime: DateTime.now().add(Duration(seconds: 5)), // Optional delay (iOS)
    // );

    await _notificationsPlugin.show(
      0,
      'title',
      'Welcome to our fantasy app',
      platformDetails,
      payload: 'Default_Sound',
    );
  }
}