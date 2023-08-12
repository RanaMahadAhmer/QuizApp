import 'package:flutter/material.dart';
import 'welcome_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Quiz App",
      home: SafeArea(
        child: Scaffold(backgroundColor: Colors.black, body: WelcomeScreen()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
