import 'package:flutter/material.dart';
import 'package:project/components/messages.dart';
import 'package:project/components/new_message.dart';
import 'package:project/core/services/auth/auth_service.dart';
import 'package:project/core/services/notification/chat_notification_service.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'IFCHAT',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.greenAccent.shade700,
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            items: [
              DropdownMenuItem(
                  value: 'logout',
                  child: Container(
                    child: Row(children: [
                       Icon(
                        Icons.exit_to_app,
                        color: Colors.black87,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Sair")
                    ]),
                  ))
            ],
            onChanged: (value) {
              if (value == 'logout') {
                AuthService().logout();
              }
            },
          ),
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/notificações');
                  },
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  )),
              Positioned(
                  right: 10,
                  top: 7,
                  child: CircleAvatar(
                    maxRadius: 7,
                    backgroundColor: Colors.red.shade800,
                    child: Text(
                        '${Provider.of<ChatNotificationService>(context).itemsCount}',
                        style: TextStyle(color: Colors.white, fontSize: 8),),
                  ))
            ],
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Messages(),
          ),
          NewMessage()
        ],
      )),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Provider.of<ChatNotificationService>(context, listen: false).add(
              ChatNotification(
                  title: "Mais uma notificação!",
                  body: Random().nextDouble().toString()));
        },
      ),*/
    );
  }
}
