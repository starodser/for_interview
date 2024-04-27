import 'package:flutter/material.dart';

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({super.key});

  @override
  Widget build(BuildContext context) {
    // актуально еположение
    final size = MediaQuery.of(context).size; // актуальный размер

    return Container(
      height: size.height * 0.2,
      width: size.width * 0.8,
      color: Colors.blueAccent,
      alignment: Alignment.center,
      child: Text(
        'Courses : Flutter & Dart - The Complete Guide [2024 Edition] ',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
