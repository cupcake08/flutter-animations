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
          body: CustomDrawer(),
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
    return GestureDetector(
      onTap: toggle,
      child: AnimatedBuilder(
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
                  child: const MyHomePage(),
                ),
              ],
            );
          }),
    );
  }
}
