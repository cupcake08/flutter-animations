// import 'package:beginner/animations/animated_cross_fade.dart';
// import 'package:beginner/animations/size_transition.dart';
import 'package:beginner/animations/flow.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(
        child: FlowMenu(),
      ),
    );
  }
}
