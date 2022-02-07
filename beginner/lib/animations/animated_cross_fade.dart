import 'package:flutter/material.dart';

class CustomAnimatedCrossFade extends StatefulWidget {
  const CustomAnimatedCrossFade({Key? key}) : super(key: key);

  @override
  _CustomAnimatedCrossFadeState createState() =>
      _CustomAnimatedCrossFadeState();
}

class _CustomAnimatedCrossFadeState extends State<CustomAnimatedCrossFade> {
  bool _first = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 1500),
              crossFadeState:
                  _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: const FlutterLogo(
                size: 200,
                style: FlutterLogoStyle.horizontal,
              ),
              secondChild: const FlutterLogo(
                size: 200,
                style: FlutterLogoStyle.stacked,
              ),
            ),
            IconButton(
              onPressed: () => setState(() => _first = !_first),
              icon: const Icon(
                Icons.change_circle,
                size: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
