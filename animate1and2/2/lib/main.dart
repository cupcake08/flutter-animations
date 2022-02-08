import 'dart:math';

import 'package:animate1/widgets/drawer.dart';
import 'package:animate1/widgets/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animate 1",
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey,

          ///if using Custom Drawer set background color -> Colors.blue
          body: CustomDrawer2(),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  final double maxSlide = 220.0;
  Widget top() => Container(
        color: Colors.amber,
      );
  Widget bottom() => Container(
        color: Colors.blue,
      );

  void toggle() =>
      _controller.isDismissed ? _controller.forward() : _controller.reverse();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        double scale = 1 - (_controller.value * 0.4);
        double slide = maxSlide * _controller.value;
        return Stack(
          children: [
            const Back(),
            Transform(
              transform: Matrix4.identity()
                ..translate(slide)
                ..scale(scale),
              alignment: Alignment.centerLeft,
              child: MyHomePage(
                toggle: toggle,
              ),
            ),
          ],
        );
      },
    );
  }
}

class CustomDrawer2 extends StatefulWidget {
  const CustomDrawer2({Key? key}) : super(key: key);

  @override
  _CustomDrawer2State createState() => _CustomDrawer2State();
}

class _CustomDrawer2State extends State<CustomDrawer2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  final double maxSlide = 250.0;
  void toggle() =>
      _controller.isDismissed ? _controller.forward() : _controller.reverse();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Stack(
          children: [
            Transform.translate(
              offset: Offset(maxSlide * (_controller.value - 1), 0),
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(pi / 2 * (1 - _controller.value)),
                child: Back(
                  toggle: toggle,
                ),
                alignment: Alignment.centerRight,
              ),
            ),
            Transform.translate(
              offset: Offset(maxSlide * _controller.value, 0),
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(-pi / 2 * _controller.value),
                alignment: Alignment.centerLeft,
                child: MyHomePage(
                  toggle: toggle,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
