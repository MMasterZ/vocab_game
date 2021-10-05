import 'package:flutter/material.dart';
import 'package:vocab_game/style/constants.dart';

class DragtagetWidget extends StatelessWidget {
  const DragtagetWidget({
    Key? key,
    required this.question,
    required this.choice,
    required this.addFunction,
    required this.isSendAnswer,
    required this.isCorrectAnswer,
  }) : super(key: key);

  final dynamic question;
  final dynamic choice;
  final Function addFunction;
  final bool isSendAnswer;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: !isSendAnswer
            ? Colors.blue
            : isCorrectAnswer
                ? Colors.green
                : Colors.red,
      ),
      margin: EdgeInsets.symmetric(horizontal: mainPaddingDefault / 2),
      child: MaterialButton(
        onPressed: () => !isSendAnswer ? addFunction(choice['vocab']) : null,
        child: !isSendAnswer
            ? Text(
                choice['vocab'],
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            : Icon(
                isCorrectAnswer ? Icons.check : Icons.close,
                size: 36,
                color: Colors.white,
              ),
        splashColor: Colors.transparent,
      ),
    );
  }
}
