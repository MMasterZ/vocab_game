import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:vocab_game/style/constants.dart';

class BuildGame2 extends StatelessWidget {
  const BuildGame2({
    Key? key,
    required this.AnimalList,
    required this.currentIndex,
    required this.voiceText,
    required this.isListening,
    required this.addFunction,
    required this.isSendAnswer,
    required this.isCorrectAnswer,
  }) : super(key: key);

  final AnimalList;
  final currentIndex;
  final voiceText;
  final isListening;
  final isSendAnswer;
  final isCorrectAnswer;

  final Function addFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            "ออกเสียงคำศัพท์ ภาษาอังกฤษ",
            style: TextStyle(
              fontSize: 26,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 250,
          margin: EdgeInsets.symmetric(
            vertical: mainPaddingDefault / 2,
          ),
          child: Image.asset(
            AnimalList[currentIndex].url,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            bottom: 10,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2.0,
              ),
            ),
          ),
          alignment: Alignment.bottomLeft,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Text(
              "คำตอบ = ${voiceText}",
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ),
        ),
        SizedBox(
          height: mainPaddingDefault / 2,
        ),
        if (isSendAnswer && !isCorrectAnswer)
          Container(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2.0,
                ),
              ),
            ),
            alignment: Alignment.bottomLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: Text(
                "เฉลย = ${AnimalList[currentIndex].vocab}",
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
            ),
          ),
        Spacer(),
        Container(
          child: AvatarGlow(
            animate: isListening,
            endRadius: 50,
            glowColor: isListening ? Colors.grey : Colors.transparent,
            duration: Duration(milliseconds: 700),
            child: MaterialButton(
              onPressed: () => isListening ? null : addFunction(),
              padding: EdgeInsets.all(10),
              child: Icon(
                isListening ? Icons.mic : Icons.mic_none_rounded,
                size: 50,
                color: isListening ? Colors.grey : Colors.white,
              ),
              shape: CircleBorder(),
              color: isListening ? null : Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
