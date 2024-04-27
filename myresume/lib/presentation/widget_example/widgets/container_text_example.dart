import 'package:flutter/material.dart';

class ContainerTextExample extends StatelessWidget {
  const ContainerTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            // color нужен
            color: Colors.amber,
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Material(
              // Материал дизайн компоненты
              borderRadius: BorderRadius.circular(10),
              elevation: 8,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(8),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.grey,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  ' Hi !',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 27),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
