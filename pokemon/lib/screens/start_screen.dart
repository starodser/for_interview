import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.indigo,
        title: Center(
            child: Image.asset('assets/images/logo/pokemon_logo.png',
                height: 180.h, alignment: Alignment.center)),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            TextButton(onPressed: () {}, child: Text('Поиск')),
            SizedBox(
              height: 8,
            ),
            TextButton(onPressed: () {}, child: Text('Случайный'))
          ],
        ),
      ),
    );
  }
}
