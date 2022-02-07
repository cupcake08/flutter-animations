import 'package:flutter/material.dart';

class CustomSizeTransition extends StatefulWidget {
  const CustomSizeTransition({Key? key}) : super(key: key);

  @override
  _CustomSizeTransitionState createState() => _CustomSizeTransitionState();
}

class _CustomSizeTransitionState extends State<CustomSizeTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.horizontal,
        axisAlignment: -1,
        child: const Center(
          // heightFactor: 6,
          child: FlutterLogo(
            size: 200,
          ),
        ),
      ),
    );
  }
}
