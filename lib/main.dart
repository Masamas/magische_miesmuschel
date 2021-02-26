import 'dart:math';

import 'package:flutter/material.dart';

List<String> answers = [
  'Auf jeden Fall!',
  'Keineswegs.',
  'Frag ein ander Mal.',
  'Kann ich gerade nicht beantworten...',
  'So wurde es entschieden.',
  'Definitiv nicht!'
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magische Miesmuschel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MagischeMiesmuschel(),
    );
  }
}

class MagischeMiesmuschel extends StatefulWidget {
  final Random random = Random(DateTime.now().millisecondsSinceEpoch);

  @override
  _MagischeMiesmuschelState createState() => _MagischeMiesmuschelState();
}

class _MagischeMiesmuschelState extends State<MagischeMiesmuschel> {
  String answer = '';

  void updateAnswer() async {
    String newAnswer = answers[widget.random.nextInt(answers.length)];

    setState(() {
      answer = '...';
    });

    await Future.delayed(
      Duration(milliseconds: 800),
      () => {
        setState(() {
          answer = newAnswer;
        })
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magische Miesmuschel'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/magische_miesmuschel.png'),
              Text(answer, style: Theme.of(context).textTheme.headline4),
              SizedBox(height: 12.0),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
                child: Text(
                  'Fragen',
                  style: Theme.of(context).textTheme.headline6,
                ),
                onPressed: updateAnswer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
