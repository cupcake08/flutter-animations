import 'package:animations/animations/flip_bar.dart';
import 'package:flutter/material.dart';

class FlipBoxElement extends StatelessWidget {
  const FlipBoxElement({
    Key? key,
    required this.icon,
    required this.text,
    required this.frontColor,
    required this.backColor,
    required this.onTapped,
    required this.controller,
    required this.index,
    required this.appBarHeight,
  }) : super(key: key);

  final Widget icon;
  final Widget text;
  final Color frontColor;
  final Color backColor;
  final AnimationController controller;
  final ValueChanged<int> onTapped;
  final int index;
  final double appBarHeight;

  @override
  Widget build(BuildContext context) {
    return FlipBox(
      topChild: Container(
        width: double.infinity,
        height: double.infinity,
        color: frontColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
          ],
        ),
      ),
      bottomChild: Container(
        width: double.infinity,
        height: double.infinity,
        color: backColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            text,
          ],
        ),
      ),
      controller: controller,
      onTapped: () {
        onTapped(index);
      },
      height: appBarHeight,
    );
  }
}
