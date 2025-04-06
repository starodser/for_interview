import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ricky/theme/app_theme.dart';
import 'package:ricky/theme/mode_theme.dart';
import 'package:ricky/view/screens/home.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Rick and Morty',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ref.watch(themeNotifierProvider), 
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
