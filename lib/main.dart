import 'package:flutter/material.dart';
import 'package:project/core/services/notification/chat_notification_service.dart';
import 'package:project/pages/auth_or_app_page.dart';
import 'package:project/pages/chat_page.dart';
import 'package:project/pages/notification_page.dart';
import 'package:provider/provider.dart';
import 'pages/LoginPage.dart';
import 'pages/SignupPage.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ChatNotificationService())
        ],
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => AuthOrAppPage(),
            '/login': (context) => LoginPage(),
            '/cadastro': (context) => SignupPage(),
            '/notificações': (context) => NotificationPage(),
            '/chat': (context) => ChatPage()
          },
          theme: ThemeData(primarySwatch: Colors.green),
        ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
