import 'package:flutter/material.dart';
import 'package:resume/presentation/theme_animation/theme_animation.dart';
import './presentation/widget_example/widgets_examples_page.dart';
import './presentation/counter_app/widgets/counter_app.dart';

class RootWidget extends StatefulWidget {
  const RootWidget({super.key});

  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          WidgetsExamplesPage(),
          CounterApp(),
          ThemeAnimationPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.amber,
        backgroundColor: Theme.of(context).appBarTheme.color,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'example'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'counter'),
          BottomNavigationBarItem(
              icon: Icon(Icons.color_lens_sharp), label: 'theme'),
        ],
      ),
    );
  }
}
