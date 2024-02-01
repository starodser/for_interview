import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  bool shoulShowInput = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Поиск',
          ),
        ),
      ),
      body: Column(
        children: [
          if (shoulShowInput) ...[const TextFieldInput()],
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                shoulShowInput = true;
              });
            },
            child: const Icon(
              Icons.add_rounded,
              size: 35,
              color: Color.fromRGBO(35, 35, 35, 1),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldInput extends StatefulWidget {
  const TextFieldInput({Key? key}) : super(key: key);
  @override
  _TextFieldInputState createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(
          height: 13,
        ),
        TextField(
          decoration: InputDecoration(border: OutlineInputBorder()),
        )
      ],
    );
  }
}
