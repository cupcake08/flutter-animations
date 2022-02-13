import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Curved Animation Nav Bar",
      theme: ThemeData.dark(),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 2;

  final List<Widget> items = const [
    Icon(
      Icons.home,
      size: 30,
      color: Colors.black,
    ),
    Icon(
      Icons.search,
      size: 30,
      color: Colors.black,
    ),
    Icon(
      Icons.favorite,
      size: 30,
      color: Colors.black,
    ),
    Icon(
      Icons.settings,
      size: 30,
      color: Colors.black,
    ),
    Icon(
      Icons.person,
      size: 30,
      color: Colors.black,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("Curved Navigation Bar"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          '$index',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        index: index,
        items: items,
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.blue,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
