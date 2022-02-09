import 'package:animations/animations/flip_box.dart';
import 'package:animations/models/flip_bar_item.dart';
import 'package:flutter/material.dart';

class FlipBoxBar extends StatefulWidget {
  const FlipBoxBar({
    Key? key,
    required this.items,
    this.animationDuration = const Duration(seconds: 1),
    required this.onIndexChanged,
    required this.selectedIndex,
    this.navBarHeight = 100.0,
  }) : super(key: key);

  final List<FlipBarItem> items;
  final Duration animationDuration;
  final ValueChanged<int> onIndexChanged;
  final int selectedIndex;
  final double navBarHeight;

  @override
  _FlipBoxBarState createState() => _FlipBoxBarState();
}

class _FlipBoxBarState extends State<FlipBoxBar> with TickerProviderStateMixin {
  late final List<AnimationController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.items.length; i++) {
      _controllers.add(AnimationController(
        vsync: this,
        duration: widget.animationDuration,
      ));
    }
    _controllers[widget.selectedIndex].forward();
  }

  @override
  Widget build(BuildContext context) {
    _changedValue();
    return SizedBox(
      height: 100.0,
      child: Row(
        children: widget.items.map((item) {
          int index = widget.items.indexOf(item);
          return Expanded(
            child: FlipBoxElement(
              icon: item.icon,
              appBarHeight: widget.navBarHeight,
              backColor: item.backColor,
              frontColor: item.frontColor,
              controller: _controllers[index],
              onTapped: (index) {
                _changedValue();
                widget.onIndexChanged(index);
              },
              index: index,
              text: item.text,
            ),
          );
        }).toList(),
      ),
    );
  }

  void _changedValue() {
    for (AnimationController controller in _controllers) {
      controller.reverse();
    }
    _controllers[widget.selectedIndex].forward();
  }

  @override
  void dispose() {
    super.dispose();
    for (AnimationController controller in _controllers) {
      controller.dispose();
    }
  }
}
