import 'dart:async';
import 'dart:math';
import 'package:project/components/new_message.dart';
import 'package:project/core/models/chat_message.dart';
import 'package:project/core/services/chat/chat_service.dart';

import '../../models/chat_user.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
        id: '1',
        text: 'Bom dia',
        createdAt: DateTime.now(),
        userId: '123',
        userName: 'Gustavo',
        userImageURL: 'assets/user-icon.png'),
    ChatMessage(
        id: '2',
        text: 'Bom dia. Fez o trabalho?',
        createdAt: DateTime.now(),
        userId: '321',
        userName: 'Guilherme',
        userImageURL: 'assets/user-icon.png'),
    ChatMessage(
        id: '1',
        text: 'Claro',
        createdAt: DateTime.now(),
        userId: '123',
        userName: 'Gustavo',
        userImageURL: 'assets/user-icon.png'),
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  Future<ChatMessage> save(String text, ChatUser user) async {
    final NewMessage = (ChatMessage(
        id: Random().nextDouble().toString(),
        text: text,
        createdAt: DateTime.now(),
        userId: user.id,
        userName: user.name,
        userImageURL: user.ImageURL));

    _msgs.add(NewMessage);
    _controller?.add(_msgs);
    return NewMessage;
  }
}
