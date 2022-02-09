import 'package:flutter/material.dart';

class Back extends StatelessWidget {
  const Back({Key? key, this.toggle}) : super(key: key);
  final VoidCallback? toggle;
  final Color text = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      child: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(25),
        constraints: const BoxConstraints(
          maxWidth: 250,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Flutter",
              style: TextStyle(
                color: text,
                fontWeight: FontWeight.w400,
                fontSize: 40,
              ),
            ),
            Text(
              "Europe",
              style: TextStyle(
                color: text,
                fontWeight: FontWeight.bold,
                fontSize: 55,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.web_sharp,
                      color: text,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "News",
                      style: TextStyle(color: text),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: text,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Favourite",
                      style: TextStyle(color: text),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.map,
                      color: text,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Maps",
                      style: TextStyle(color: text),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: text,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(color: text),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: text,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(color: text),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
