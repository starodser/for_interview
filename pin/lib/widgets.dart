import 'package:flutter/material.dart';
import 'package:pin/style.dart';

class CustomButton extends StatelessWidget {
  final String nameNumber;
  final Function onPressed;
  const CustomButton(
      {Key? key, required this.nameNumber, required this.onPressed})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () => onPressed(nameNumber),
      child: Container(
        width: 100,
        height: 80,
        padding: padd13,
        child: Center(
          child: nameNumber.isEmpty
              ? const Icon(
                  Icons.backspace_outlined,
                  color: Color.fromRGBO(123, 97, 255, 1),
                )
              : Text(
                  nameNumber,
                  style: const TextStyle(fontSize: 32),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}

class ViewWidget extends StatelessWidget {
  final String viewNumber;
  const ViewWidget({required this.viewNumber});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        width: 70,
        height: 70,
        child: Center(
          child: Text(
            viewNumber,
            style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(123, 97, 255, 1)),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(208, 235, 232, 232),
              blurRadius: 10.0,
              offset: Offset(
                5.0,
                5.0,
              ),
            )
          ],
        ));
  }
}
