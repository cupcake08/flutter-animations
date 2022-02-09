import 'dart:math';

import 'package:flutter/material.dart';

class FlipBox extends StatefulWidget {
  const FlipBox({
    Key? key,
    required this.topChild,
    required this.bottomChild,
    this.height = 100.0,
    this.controller,
    this.onTapped,
  }) : super(key: key);

  final Widget topChild;
  final Widget bottomChild;
  final double height;
  final AnimationController? controller;
  final VoidCallback? onTapped;

  @override
  _FlipBoxState createState() => _FlipBoxState();
}

class _FlipBoxState extends State<FlipBox> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  // final double height = 100.0;
  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2000),
      );
    } else {
      controller = widget.controller!;
    }
    animation = Tween(begin: 0.0, end: pi / 2).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.elasticInOut,
    ));
    controller.addListener(() {
      setState(() {});
    });
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.height,
      child: Stack(
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(
                0.0,
                -(cos(animation.value) * (widget.height / 2)),
                -((widget.height / 2) * sin(animation.value)),
              )
              ..rotateX(-(pi / 2) + animation.value),
            child: SizedBox(
              child: Center(
                child: widget.bottomChild,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              widget.onTapped!();
              controller.forward();
            },
            child: animation.value < (85 * pi / 180)
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..translate(
                        0.0,
                        widget.height / 2 * sin(animation.value),
                        -((widget.height / 2) * cos(animation.value)),
                      )
                      ..rotateX(animation.value),
                    // ..rotateX(pi),
                    child: SizedBox(
                      child: Center(
                        child: widget.topChild,
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
