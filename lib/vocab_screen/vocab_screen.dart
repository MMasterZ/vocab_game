import 'package:flutter/material.dart';
import 'package:vocab_game/vocab_screen/compomnents/build_body.dart';

class VocabGameScreen extends StatelessWidget {
  const VocabGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Theme.of(context).primaryColor,
          ),
      // backgroundColor: mainPrimaryColor,
      body: BuildBody(),
    );
  }
}
