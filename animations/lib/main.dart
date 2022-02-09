import 'package:animations/animations/fliip_box_bar.dart';
// import 'package:animations/animations/flip_bar.dart';
import 'package:animations/models/flip_bar_item.dart';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      title: "Animations",
      home: const SafeArea(
        child: Test(),
      ),
    );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flip-Box-Bar'),
      ),
      bottomNavigationBar: FlipBoxBar(
        items: [
          FlipBarItem(
              icon: const Icon(Icons.map),
              text: const Text("Map"),
              frontColor: Colors.blue,
              backColor: Colors.blueAccent),
          FlipBarItem(
              icon: const Icon(Icons.add),
              text: const Text("Add"),
              frontColor: Colors.cyan,
              backColor: Colors.cyanAccent),
          FlipBarItem(
              icon: const Icon(Icons.chrome_reader_mode),
              text: const Text("Read"),
              frontColor: Colors.orange,
              backColor: Colors.orangeAccent),
          FlipBarItem(
              icon: const Icon(Icons.print),
              text: const Text("Print"),
              frontColor: Colors.purple,
              backColor: Colors.purpleAccent),
          FlipBarItem(
              icon: const Icon(Icons.print),
              text: const Text("Print"),
              frontColor: Colors.pink,
              backColor: Colors.pinkAccent),
        ],
        selectedIndex: selectedIndex,
        onIndexChanged: (newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
      ),
    );
  }
}
