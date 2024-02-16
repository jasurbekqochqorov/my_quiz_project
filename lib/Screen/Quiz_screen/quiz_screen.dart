import 'package:flutter/material.dart';
import 'package:homework12/Screen/global_widget/appBar.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [
        GlobalAppBar(title:"Testlar"),

      ],),
    );
  }
}
