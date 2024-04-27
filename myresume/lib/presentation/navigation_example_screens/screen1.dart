import 'package:flutter/material.dart';
import 'package:resume/presentation/widget_example/widgets/custom_button.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Screen1'),
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
                  buttonColor: Colors.green),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/screen2');
                  },
                  text: 'Screen2',
                  buttonColor: Colors.green),
            ],
          ),
        ));
  }
}
