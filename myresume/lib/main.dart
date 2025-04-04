import 'package:flutter/material.dart';
import 'package:resume/presentation/navigation_example_screens/screen1.dart';
import 'package:resume/presentation/navigation_example_screens/screen2.dart';
import './root.dart';
import 'theme.dart';
import 'package:provider/provider.dart';
import 'application/theme_service.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeService(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          "/root": (BuildContext cxt) => const RootWidget(),
          "/screen1": (BuildContext cxt) => const Screen1(),
          "/screen2": (BuildContext cxt) => const Screen2(),
        },
        home: const RootWidget(),
      );
    });
  }
}
