import 'package:flutter/material.dart';

class PageViewExample extends StatelessWidget {
  const PageViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: SinglePage(
          size: size,
          title: 'Skills :',
          text: ' Provider , Bloc , Firebase , Riverpod, Rest API ',
        ),
      ),
    );
  }
}

class SinglePage extends StatelessWidget {
  final Size size;
  final String title;
  final String text;

  const SinglePage(
      {super.key, required this.size, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.3,
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.blueGrey[700], borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 27),
          ),
          const SizedBox(height: 15),
          Text(
            text,
            style: const TextStyle(color: Colors.amberAccent, fontSize: 20),
            textAlign: TextAlign.center,
          )
        ]),
      ),
    );
  }
}
