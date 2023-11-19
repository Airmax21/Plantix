import 'package:flutter/material.dart';
import 'package:plantix/constants.dart';
import 'package:plantix/models/Message.dart';

class BubbleChat extends StatelessWidget {
  final Message message;

  const BubbleChat({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMe = (message.from == kIdentifier) ? true : false;
    return Align(
      alignment: isMe ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey,
        ),
        child: Text(
          '${(message.from == kIdentifier) ? 'You' : message.from}: ${message.msg}',
          style: TextStyle(color: isMe ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
