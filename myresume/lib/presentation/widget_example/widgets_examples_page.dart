import 'package:flutter/material.dart';
import 'package:resume/presentation/widget_example/widgets/profile.dart';
import './widgets/container_text_example.dart';
import './widgets/row_expanded_example.dart';
import './widgets/media_query_example.dart';
import './widgets/page_view_example.dart';
import './widgets/custom_button.dart';
import 'package:provider/provider.dart';
import '../../application/theme_service.dart';

class WidgetsExamplesPage extends StatelessWidget {
  const WidgetsExamplesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        leading: const Icon(Icons.data_usage),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        title: const Text('Resume '),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // нельзя скроллить listView и scrollview
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const ContainerTextExample(),
                const SizedBox(height: 10),
                const RowExpandedExample(),
                const SizedBox(width: 10, height: 30),
                const Profile(),
                const SizedBox(height: 20),
                const PageViewExample(),
                const SizedBox(width: 20, height: 30),
                const MediaQueryExample(),
                const SizedBox(width: 20, height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/screen1');
                      },
                      text: 'Screen1 !',
                      buttonColor: Colors.blueAccent[200]!,
                    ),
                    const SizedBox(width: 20, height: 30),
                    CustomButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/screen2');
                      },
                      text: 'Screen2 !',
                      buttonColor: Colors.blueGrey,
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Switch(
                    value: Provider.of<ThemeService>(context).isDarkModeOn,
                    onChanged: (value) {
                      Provider.of<ThemeService>(context, listen: false)
                          .toggleTheme();
                    })
              ],
            ),
          ),
        ),
      ), //PLaceHolder
    );
  }
}
