import 'package:flutter/material.dart';
import 'package:pin/cubit/first_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => FirstCubit(),
          child: MyHomePage(),
        ));
  }
}
