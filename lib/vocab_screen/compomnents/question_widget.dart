import 'package:flutter/material.dart';
import 'package:vocab_game/style/constants.dart';
import 'package:vocab_game/vocab_screen/compomnents/draggble_widget.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.AnimalList,
    required this.currentIndex,
    required this.isSendAnswer,
  }) : super(key: key);

  final List AnimalList;
  final int currentIndex;
  final bool isSendAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DraggbleWidget(
        animal: AnimalList[currentIndex],
        isSendAnswer: isSendAnswer,
      ),
      margin: EdgeInsets.only(
        top: mainPaddingDefault,
        bottom: mainPaddingDefault * 2,
      ),
    );
  }
}
