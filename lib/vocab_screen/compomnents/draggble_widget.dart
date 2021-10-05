import 'package:flutter/material.dart';

class DraggbleWidget extends StatelessWidget {
  const DraggbleWidget({
    Key? key,
    required this.animal,
    required this.isSendAnswer,
  }) : super(key: key);

  final animal;

  final bool isSendAnswer;

  @override
  Widget build(BuildContext context) {
    return !isSendAnswer
        ? Draggable(
            data: animal,
            child: _BuildImage(),
            feedback: _BuildFeedback(),
            childWhenDragging: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5.0,
                  color: Colors.blue,
                ),
              ),
            ),
          )
        : Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                width: 5.0,
                color: Colors.blue,
              ),
            ),
            child: Image.asset(
              animal.url,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          );
  }

  Widget _BuildImage() {
    return Material(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 5.0,
          ),
        ),
        alignment: Alignment.center,
        child: AnimatedSwitcher(
          duration: Duration(
            milliseconds: 2000,
          ),
          reverseDuration: Duration(
            milliseconds: 5000,
          ),
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: SizedBox.expand(
              child: child,
            ),
          ),
          child: Image.asset(
            animal.url,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _BuildFeedback() {
    return Material(
      child: Container(
        width: 170,
        height: 170,
        decoration: BoxDecoration(
          color: Colors.blue,
          // border: Border.all(
          //   color: Colors.blue,
          //   width: 5.0,
          // ),
          borderRadius: BorderRadius.circular(5),
          backgroundBlendMode: BlendMode.darken,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 30,
            )
          ],
        ),
        alignment: Alignment.center,
        child: AnimatedSwitcher(
          duration: Duration(
            milliseconds: 2000,
          ),
          reverseDuration: Duration(
            milliseconds: 5000,
          ),
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: SizedBox.expand(
              child: child,
            ),
          ),
          child: Image.asset(
            animal.url,
            width: 170,
            height: 170,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
