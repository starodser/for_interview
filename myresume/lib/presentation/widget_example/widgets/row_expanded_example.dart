import 'package:flutter/material.dart';

class RowExpandedExample extends StatelessWidget {
  const RowExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          color: Colors.amber,
          height: 40,
          width: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 3,
            child: Container(
              color: Colors.indigoAccent,
              height: 40,
              width: 20,
            )),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            // забиарает максимум пространства
            flex: 2, // часть забираемого простраства
            child: Container(
              color: Colors.purpleAccent,
              height: 40,
              width: 20,
            )),
        const SizedBox(
          width: 10,
        ),
        Container(
          color: Colors.amber,
          height: 40,
          width: 20,
        )
      ],
    );
  }
}
