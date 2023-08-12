import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Widget? _currentScreen;

  Widget _getWelcomeScreen() {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.grey.shade900),
        onPressed: () {
          setState(() {});
        },
        child: const Text(
          "Welcome To Quiz\nLet's Get Started!",
          style: TextStyle(color: Colors.white, fontSize: 27),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _currentScreen =
        (_currentScreen == null) ? _getWelcomeScreen() : const QuizScreen();
    return _currentScreen!;
  }
}
