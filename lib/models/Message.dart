import 'package:flutter/material.dart';

class Message {
  final String from;
  final String msg;
  final int timestamp;

  Message({
    required this.from,
    required this.msg,
    this.timestamp = 0,
  });
}
