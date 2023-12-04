import 'package:flutter/material.dart';
import 'package:project/core/models/chat_user.dart';
import 'package:project/core/services/auth/auth_service.dart';
import 'package:project/core/services/notification/chat_notification_service.dart';
import 'package:project/pages/LoginPage.dart';
import 'package:project/pages/chat_page.dart';
import 'package:project/pages/loading_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({Key? key}) : super(key: key);

  Future<void> init(BuildContext context) async {
    await Firebase.initializeApp();
    await Provider.of<ChatNotificationService>(
      context,
      listen: false
    ).init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: init(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage();
          } else {
            return StreamBuilder<ChatUser?>(
              stream: AuthService().userChanges,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingPage();
                } else {
                  return snapshot.hasData ? ChatPage() : LoginPage();
                }
              },
            );
          }
        });
  }
}
