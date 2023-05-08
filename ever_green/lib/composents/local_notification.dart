



import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
class LocalChallengeNotification {
  static final FlutterLocalNotificationsPlugin _notification = FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon'); // Replace 'app_icon' with your own icon name
    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    await _notification.initialize(initializationSettings);
  }

  static Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'channel id',
      'channel name',
      color: Colors.blue, // Replace with your desired color
      channelDescription: 'channel description',
      importance: Importance.max,
    );

    return const NotificationDetails(android: androidNotificationDetails);
  }

  static Future<void> showDailyChallengeNotification({
    int id = 0,
    required String? title,
    required String? body,
    required String? payload,
    required DateTime scheduledDate,
  }) async {
    await _notification.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      await _notificationDetails(),
      payload: payload,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
