import 'package:flutter/material.dart';
import 'package:vocab_game/vocab_screen/vocab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vocab Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Demo Vocab Game'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: MaterialButton(
            onPressed: () => Navigator.of(context).push(
              _createRouteAnimation(),
            ),
            child: Text(
              "VOCAB GAME",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            color: Colors.blue,
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Route _createRouteAnimation() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const VocabGameScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
