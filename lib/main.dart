import 'package:flutter/material.dart';
import 'chatUi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple chat ui',
      debugShowCheckedModeBanner: false,
      home: ChatUi(),
    );
  }
}
