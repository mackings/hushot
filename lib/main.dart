import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hushot_technologies/Views/Signup.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hushot_technologies/Views/onboard1.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( ProviderScope(child: MyApp()));
  await Firebase.initializeApp();

  AwesomeNotifications().initialize("resource://drawable/slide4", [
    NotificationChannel(
      channelShowBadge: true,
      channelKey: "Job Notifications",
      channelName: "Jobs",
      channelDescription: "Notifications",
      playSound: true,
      enableVibration: true,
    )
  ]);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Onboard1(),
    );
  }
}

Future<void> _handler(RemoteMessage message) async {
  await AwesomeNotifications().createNotificationFromJsonData(message.data);
}
