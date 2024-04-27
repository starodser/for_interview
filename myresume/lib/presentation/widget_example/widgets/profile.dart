import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "I'm Flutter Developer ",
            style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent),
          ),
        ],
      ),
    );
  }
}
