import 'package:flutter/material.dart';

class FlowMenu extends StatefulWidget {
  const FlowMenu({Key? key}) : super(key: key);

  @override
  _FlowMenuState createState() => _FlowMenuState();
}

class _FlowMenuState extends State<FlowMenu>
    with SingleTickerProviderStateMixin {
  final buttonSize = 30;
  late AnimationController controller;
  IconData lastTapped = Icons.notifications;
  final List<IconData> icons = [
    Icons.menu,
    Icons.home_rounded,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
  ];

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() {
        lastTapped = icon;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget flowMenuItem(IconData icon) {
    return FloatingActionButton(
      onPressed: () {
        _updateMenu(icon);
        controller.status == AnimationStatus.completed
            ? controller.reverse()
            : controller.forward();
      },
      backgroundColor: lastTapped == icon ? Colors.amber[500] : Colors.blue,
      child: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
      splashColor: Colors.amber[100],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flow Widget"),
        centerTitle: true,
      ),
      body: Flow(
        delegate: FlowMenuDelegate(menuAnimation: controller),
        children: icons.map((IconData icon) => flowMenuItem(icon)).toList(),
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({required this.menuAnimation})
      : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;
  @override
  void paintChildren(FlowPaintingContext context) {
    double margin = 6;
    double dx = 0.0;
    final size = context.size;
    final xStart = size.width - 70;
    final yStart = size.height - 80;
    for (int i = context.childCount - 1; i >= 0; i--) {
      dx = (context.getChildSize(i)!.width + margin) * i;
      final x = xStart;
      final y = yStart - dx * menuAnimation.value;
      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }
}
