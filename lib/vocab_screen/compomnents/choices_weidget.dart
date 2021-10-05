import 'package:flutter/material.dart';
import 'package:vocab_game/vocab_screen/compomnents/drag_target_widget.dart';

class ChoicesWidget extends StatelessWidget {
  const ChoicesWidget({
    Key? key,
    required this.AnimalList,
    required this.currentIndex,
    required this.AnimalChoices,
    required this.addFunction,
    required this.isSendAnswer,
    required this.isCorrectAnswer,
  }) : super(key: key);

  final AnimalList;
  final currentIndex;
  final AnimalChoices;
  final bool isSendAnswer;
  final addFunction;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DragTarget(
          builder: (context, accepted, rejectedData) => Center(
            child: DragtagetWidget(
              question: AnimalList[currentIndex],
              choice: AnimalChoices[0],
              addFunction: addFunction,
              isSendAnswer: isSendAnswer,
              isCorrectAnswer: isCorrectAnswer,
            ),
          ),
          onAccept: (vocab) => addFunction(AnimalChoices[0]['vocab']),
        ),
        DragTarget(
          builder: (context, accepted, reject) => Center(
            child: DragtagetWidget(
              question: AnimalList[currentIndex],
              choice: AnimalChoices[1],
              addFunction: addFunction,
              isSendAnswer: isSendAnswer,
              isCorrectAnswer: isCorrectAnswer,
            ),
          ),
          onAccept: (vocab) => addFunction(AnimalChoices[1]['vocab']),
        ),
      ],
    );
  }
}
