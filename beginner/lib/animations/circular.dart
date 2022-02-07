import 'package:flutter/material.dart';

class CircularAnimation extends StatefulWidget {
  const CircularAnimation({Key? key}) : super(key: key);

  @override
  _CircularAnimationState createState() => _CircularAnimationState();
}

class _CircularAnimationState extends State<CircularAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final double buttonSize = 65;
  final double margin = 70;
  final Color color = Colors.blue;
  final Color iconColor = Colors.white;
  final double iconSize = 30;
  final Color menuColor = Colors.teal;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    // ..forward();
    // ..forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void toggle() {
    _controller.status == AnimationStatus.completed
        ? _controller.reverse()
        : _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Circular Flow"),
      ),
      body: Center(
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Transform(
                  transform: Matrix4.translationValues(
                      margin * _controller.value, 0, 0),
                  child: Container(
                    // transform: Matrix4.identity()..translate(45),
                    width: buttonSize,
                    height: buttonSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(buttonSize / 2),
                      color: color,
                    ),
                    child: Icon(
                      Icons.share,
                      color: iconColor,
                      size: iconSize,
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Transform(
                  transform: Matrix4.translationValues(
                      0, margin * _controller.value, 0),
                  child: Container(
                    width: buttonSize,
                    height: buttonSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(buttonSize / 2),
                      color: color,
                    ),
                    child: Icon(
                      Icons.home,
                      color: iconColor,
                      size: iconSize,
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Transform(
                  transform: Matrix4.translationValues(
                      0, -margin * _controller.value, 0),
                  child: Container(
                    width: buttonSize,
                    height: buttonSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(buttonSize / 2),
                      color: color,
                    ),
                    child: Icon(
                      Icons.settings,
                      color: iconColor,
                      size: iconSize,
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) => Transform(
                transform: Matrix4.translationValues(
                    -margin * _controller.value, 0, 0),
                child: Container(
                  width: buttonSize,
                  height: buttonSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(buttonSize / 2),
                    color: color,
                  ),
                  child: Icon(
                    Icons.notifications,
                    color: iconColor,
                    size: iconSize,
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return GestureDetector(
                  onTap: toggle,
                  child: Container(
                    width: buttonSize,
                    height: buttonSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(buttonSize / 2),
                      color: menuColor,
                    ),
                    child: Center(
                      child: AnimatedIcon(
                        size: iconSize,
                        icon: AnimatedIcons.menu_close,
                        progress: _controller,
                        color: iconColor,
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
