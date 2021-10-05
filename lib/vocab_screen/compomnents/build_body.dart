import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:vocab_game/content/animal_data.dart';
import 'package:vocab_game/style/constants.dart';
import 'package:vocab_game/vocab_screen/games/games_1.dart';
import 'package:vocab_game/vocab_screen/games/games_2.dart';

class BuildBody extends StatefulWidget {
  const BuildBody({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  SpeechToText _speechToText = SpeechToText();

  String gameMode = "2";

  List AnimalList = [];
  List AnimalChoices = [];
  int currentIndex = 0;

  bool isCorrectAnswer = false;
  bool isSendAnswer = false;

  int score = 0;

  @override
  void initState() {
    super.initState();
    _RandomQuestion();
  }

  void _RandomQuestion() {
    var randomAnimal = demoAnimalList;

    randomAnimal.shuffle();

    setState(() {
      AnimalList = randomAnimal;
      AnimalChoices = randomAnimal[currentIndex].choices;
      AnimalChoices.shuffle();
    });
  }

  void _SendAnswer(String answer) {
    setState(() {
      isSendAnswer = true;

      if (AnimalList[currentIndex].vocab == answer.toLowerCase()) {
        // print("Correct");
        isCorrectAnswer = true;
        score++;
        _showModelBottom('Correct');
        Timer(const Duration(milliseconds: 1000), () {
          Navigator.pop(context);
        });
      } else {
        // print("Incorrect");
        isCorrectAnswer = false;
        score = 0;
        _showModelBottom('Incorrect');
        Timer(const Duration(milliseconds: 1000), () {
          Navigator.pop(context);
        });
      }

      Timer(const Duration(milliseconds: 1000), () {
        if (currentIndex + 1 == demoAnimalList.length) {
          currentIndex = 0;
        } else {
          currentIndex++;
        }

        if (score % 3 == 0) {
          var randomNumber = new Random().nextInt(2) + 1;
          gameMode = randomNumber.toString();
        }

        _RandomQuestion();
        isSendAnswer = false;
        isCorrectAnswer = false;
        voiceText = '...';
      });
    });
  }

  void _showModelBottom(String type) {
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 100,
            decoration: BoxDecoration(
              color: isCorrectAnswer ? Colors.green : Colors.red,
            ),
            child: Center(
              child: Text(
                type,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }

  bool isListening = false;
  String voiceText = "...";

  void _listen() async {
    if (!isListening) {
      setState(() {
        isListening = true;
      });

      bool isAvailble = await _speechToText.initialize(
          onStatus: (status) => print("onStatus : $status"),
          onError: (error) {
            setState(() {
              isListening = false;
            });
          });

      if (isAvailble) {
        await _speechToText.listen(
          onResult: (SpeechRecognitionResult result) {
            if (result.finalResult) {
              setState(() {
                voiceText = result.recognizedWords;
                isListening = false;

                _SendAnswer(voiceText);
              });
            }
          },
        );
      } else {
        setState(() {
          isListening = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        mainPaddingDefault,
      ),
      child: FutureBuilder(
        builder: (context, projectSnap) {
          switch (gameMode) {
            case '1':
              return BuildGame1(
                  AnimalList: AnimalList,
                  AnimalChoices: AnimalChoices,
                  currentIndex: currentIndex,
                  isSendAnswer: isSendAnswer,
                  isCorrectAnswer: isCorrectAnswer,
                  addFunction: _SendAnswer,
                  score: score);
            case "2":
              return BuildGame2(
                AnimalList: AnimalList,
                currentIndex: currentIndex,
                isListening: isListening,
                addFunction: _listen,
                voiceText: voiceText,
                isSendAnswer: isSendAnswer,
                isCorrectAnswer: isCorrectAnswer,
              );
            default:
              Container();
          }
          return Container();
        },
      ),
    );
  }
}
