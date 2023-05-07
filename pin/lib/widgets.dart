import 'package:flutter/material.dart';
import 'package:pin/style.dart';
import 'cubit/first_cubit.dart';

class CustomButton extends StatelessWidget {
  final String nameNumber;
  final Function onPressed;
  CustomButton({Key? key, required this.nameNumber, required this.onPressed})
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
        padding: EdgeInsets.all(13),
        child: Center(
          child: nameNumber.isEmpty
              ? Icon(
                  Icons.backspace_outlined,
                  color: Color.fromRGBO(123, 97, 255, 1),
                )
              : Text(
                  nameNumber,
                  style: TextStyle(fontSize: 32), //headText,
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}

class ViewWidget extends StatelessWidget {
  final String viewNumber;
  ViewWidget({required this.viewNumber});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        width: 70,
        height: 70,
        child: Center(
          child: Text(
            viewNumber,
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(123, 97, 255, 1)),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
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
