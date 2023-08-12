import 'package:flutter/material.dart';
import 'questions_manger.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late QuestionManager questionManager;
  late String question;

  _QuizScreenState() {
    questionManager = QuestionManager.getInstance();
    question = questionManager.getQuestion();
  }

  Expanded _createButton(
      {required Color color, required String text, required truthValue}) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    questionManager.updateScore(
                        truthValue: truthValue, question: question);
                    question = questionManager.getQuestion();
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: color),
                child: Text(text,
                    style: TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.height * 0.027)))));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: Center(
            child: Text(
              question,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.035,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        if (!questionManager.quizFinished())
          _createButton(
              color: Colors.green.shade600, text: "True", truthValue: true),
        if (!questionManager.quizFinished())
          _createButton(
              color: Colors.red.shade600, text: "False", truthValue: false),
      ],
    );
  }
}
