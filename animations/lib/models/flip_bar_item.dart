import 'package:flutter/material.dart';

class FlipBarItem {
  final Widget icon, text;
  final Color frontColor, backColor;
  FlipBarItem({
    required this.icon,
    required this.text,
    this.frontColor = Colors.blueAccent,
    this.backColor = Colors.blue,
  });
}
