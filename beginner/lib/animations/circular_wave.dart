import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularWave extends StatefulWidget {
  const CircularWave({Key? key}) : super(key: key);

  @override
  State<CircularWave> createState() => _CircularWaveState();
}

class _CircularWaveState extends State<CircularWave>
    with SingleTickerProviderStateMixin {
  double waveRadius = 0.0;
  double waveGap = 10.0;
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween(begin: 0.0, end: waveGap).animate(_controller)
      ..addListener(() {
        setState(() {
          waveRadius = _animation.value;
        });
      });
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        size: const Size(double.infinity, double.infinity),
        painter: CircleWavePainter(waveRadius),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class CircleWavePainter extends CustomPainter {
  final double waveRadius;
  late Paint wavePaint;
  CircleWavePainter(this.waveRadius) {
    wavePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
  }
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double maxRadius = hypot(centerX, centerY);
    var currentRadius = waveRadius;

    while (currentRadius < maxRadius) {
      canvas.drawCircle(Offset(centerX, centerY), currentRadius, wavePaint);
      currentRadius += 10.0;
    }
  }

  @override
  bool shouldRepaint(covariant CircleWavePainter oldDelegate) {
    return oldDelegate.waveRadius != waveRadius;
  }

  double hypot(double x, double y) => math.sqrt(x * x + y * y);
}
