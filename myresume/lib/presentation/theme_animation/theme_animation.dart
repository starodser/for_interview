import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/application/theme_service.dart';

class ThemeAnimationPage extends StatelessWidget {
  const ThemeAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return Scaffold(
        backgroundColor: themeData.scaffoldBackgroundColor,
        appBar: AppBar(
          leading: Icon(Icons.data_usage),
          centerTitle: true,
          backgroundColor: themeData.appBarTheme.color,
          title: const Text('Animation'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 20,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: themeData.colorScheme.primary),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Heading',
                        style: themeData.textTheme.headline1!
                            .copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Body',
                        style: themeData.textTheme.bodyText1!
                            .copyWith(fontSize: 14),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dark',
                            style: themeData.textTheme.bodyText1!
                                .copyWith(fontSize: 14),
                          ),
                          const SizedBox(width: 15),
                          Switch(
                              value: themeService.isDarkModeOn,
                              onChanged: (value) {
                                Provider.of<ThemeService>(context,
                                        listen: false)
                                    .toggleTheme();
                              })
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
