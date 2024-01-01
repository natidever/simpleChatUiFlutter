import 'package:flutter/material.dart';

class UserMessage {
  final String text;
  final DateTime date;
  bool isSentByMe;

  UserMessage(
      {required this.date, required this.isSentByMe, required this.text});
}
