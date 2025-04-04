import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick/view/screens/homepage.dart';
import 'package:rick/view/viewmodel/general.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => First())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        ),
        home: const HomePage(),
      ),
    );
  }
}
