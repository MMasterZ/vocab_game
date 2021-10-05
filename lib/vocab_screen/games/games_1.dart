import 'package:flutter/material.dart';
import 'package:vocab_game/style/constants.dart';
import 'package:vocab_game/vocab_screen/compomnents/choices_weidget.dart';
import 'package:vocab_game/vocab_screen/compomnents/question_widget.dart';

class BuildGame1 extends StatelessWidget {
  const BuildGame1({
    Key? key,
    required this.score,
    required this.AnimalList,
    required this.AnimalChoices,
    required this.currentIndex,
    required this.addFunction,
    required this.isSendAnswer,
    required this.isCorrectAnswer,
  }) : super(key: key);

  final int score;
  final List AnimalList;
  final List AnimalChoices;
  final int currentIndex;
  final Function addFunction;

  final bool isSendAnswer;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: mainPaddingDefault / 2,
                ),
                child: Text(
                  "จับคู่คำศัพท์",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                child: Text(
                  "คะแนน $score",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            QuestionWidget(
              AnimalList: AnimalList,
              currentIndex: currentIndex,
              isSendAnswer: isSendAnswer,
            ),
            ChoicesWidget(
              AnimalList: AnimalList,
              currentIndex: currentIndex,
              AnimalChoices: AnimalChoices,
              addFunction: addFunction,
              isSendAnswer: isSendAnswer,
              isCorrectAnswer: isCorrectAnswer,
            ),
          ],
        ),
      ],
    );
  }
}
