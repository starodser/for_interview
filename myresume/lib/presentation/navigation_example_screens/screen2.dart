import 'package:flutter/material.dart';
import 'package:resume/presentation/widget_example/widgets/custom_button.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Screen2'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: 'Back',
                  buttonColor: Colors.red),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/screen1');
                  },
                  text: 'Screen1',
                  buttonColor: Colors.red),
            ],
          ),
        ));
  }
}
