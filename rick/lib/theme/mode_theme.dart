import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeNotifier extends StateNotifier<ThemeMode> {
  final SharedPreferences prefs;
  
  ThemeNotifier(this.prefs) : super(
    prefs.getBool('isDark') ?? false ? ThemeMode.dark : ThemeMode.light
  );

  void toggle() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    prefs.setBool('isDark', state == ThemeMode.dark);
  }
}

//   Провайдеры
final sharedPrefsProvider = FutureProvider<SharedPreferences>(
  (ref) => SharedPreferences.getInstance()
);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) {
    final prefs = ref.watch(sharedPrefsProvider).value!;
    return ThemeNotifier(prefs);
  },
);