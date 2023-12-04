import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/core/models/chat_message.dart';

class MessageBubble extends StatelessWidget {
  static const _defaultImage = 'assets/user-icon.png';
  final ChatMessage message;
  final bool belongsToCurrentUser;

  const MessageBubble(
      {Key? key, required this.message, required this.belongsToCurrentUser})
      : super(key: key);

  Widget _showUserImage(String ImageURL) {
    ImageProvider? provider;

    final uri = Uri.parse(ImageURL);

    if (uri.path.contains(_defaultImage)) {
      provider = AssetImage(_defaultImage);
    } else if (uri.scheme.contains('http')) {
      provider = NetworkImage(uri.toString());
    } else {
      provider = FileImage(File(uri.toString()));
    }

    return CircleAvatar(
      backgroundImage: provider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: belongsToCurrentUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: belongsToCurrentUser
                      ? Colors.grey.shade300
                      : Colors.greenAccent.shade700,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: belongsToCurrentUser
                          ? Radius.circular(12)
                          : Radius.circular(0),
                      bottomRight: belongsToCurrentUser
                          ? Radius.circular(0)
                          : Radius.circular(12))),
              child: Column(
                crossAxisAlignment: belongsToCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    message.userName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            belongsToCurrentUser ? Colors.black : Colors.white),
                  ),
                  Text(
                    message.text,
                    textAlign: belongsToCurrentUser ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                      color: belongsToCurrentUser ? Colors.black : Colors.white
                    ),
                  ),
                ],
              ),
              width: 180,
              padding: EdgeInsets.all(12.0),
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            ),
          ],
        ),
        Positioned(
            top: 0,
            left: belongsToCurrentUser ? null : 168,
            right: belongsToCurrentUser ? 168 : null,
            child: _showUserImage(message.userImageURL))
      ],
    );
  }
}
