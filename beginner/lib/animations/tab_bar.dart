import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Nav Bar"),
      ),
      bottomNavigationBar: const BottomPart(),
    );
  }
}

class Test extends StatefulWidget {
  const Test({
    Key? key,
    required this.icon,
    required this.text,
    required this.controller,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final AnimationController controller;

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Color?> _color;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
        reverseCurve: Curves.easeOutCubic,
      ),
    );
    _color = ColorTween(begin: const Color(0xFF7C8693), end: Colors.black)
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Transform.translate(
                child: Icon(
                  widget.icon,
                  size: 30,
                  color: _color.value,
                ),
                offset: Offset(0.0, -(_animation.value * 8.0 + 10)),
              ),
              if (_controller.status == AnimationStatus.forward ||
                  _controller.status == AnimationStatus.completed)
                Opacity(
                  child: Text(widget.text,
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  opacity: _controller.value,
                ),
            ],
          );
        });
  }
}

class BottomPart extends StatefulWidget {
  const BottomPart({Key? key}) : super(key: key);

  @override
  _BottomPartState createState() => _BottomPartState();
}

class _BottomPartState extends State<BottomPart> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  final List<AnimationController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 3; i++) {
      _controllers.add(
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 800),
        ),
      );
    }
  }

  void _changeValue(int index) {
    for (var controller in _controllers) {
      controller.reverse();
    }
    _controllers[_selectedIndex].forward();
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    _changeValue(_selectedIndex);
    return Container(
      padding: const EdgeInsets.only(top: 16),
      decoration: const BoxDecoration(
        color: Color(0xFFFFD7D7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: 80,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              child: Test(
                icon: Icons.home_max_outlined,
                text: "Coach",
                controller: _controllers[0],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              child: Test(
                icon: Icons.task_alt,
                text: "Journal",
                controller: _controllers[1],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
              child: Test(
                icon: Icons.person,
                text: "Profile",
                controller: _controllers[2],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
