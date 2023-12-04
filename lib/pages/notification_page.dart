import 'package:flutter/material.dart';
import 'package:project/core/services/notification/chat_notification_service.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ChatNotificationService>(context);
    final items = service.items;
    print(service.items);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Minhas Notificações',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.greenAccent.shade700,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: service.itemsCount,
              itemBuilder: (context, i) => ListTile(
                    title: Text(items[i].title),
                    subtitle: Text(items[i].body),
                    onTap: () => service.remove(i),
                  )),
        ));
  }
}
