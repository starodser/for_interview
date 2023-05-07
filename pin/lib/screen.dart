import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin/cubit/first_cubit.dart';
import 'package:pin/style.dart';
import 'package:pin/widgets.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  List _counter = [];

  @override
  final first = FirstCubit();
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Text(
            'Введите код',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: [
            Text(
              'На ваш телефон +7 (960) 147-67-47 поступит звонок.',
              style: styleColor,
            ),
            Text(
              'Введите последние 4 цифры звонящего номера',
              style: styleColor,
            ),
          ],
        ),
        BlocBuilder<FirstCubit, FirstInitial>(
            bloc: first,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ViewWidget(viewNumber: state.meaning[0].toString()),
                    ViewWidget(viewNumber: state.meaning[1].toString()),
                    ViewWidget(viewNumber: state.meaning[2].toString()),
                    ViewWidget(viewNumber: state.meaning[3].toString())
                  ],
                ),
              );
            }),
        SizedBox(
          height: 100,
        ),
        Container(
          margin: EdgeInsets.all(10),
          height: 60,
          width: double.infinity,
          child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(99, 78, 206, 1),
                    Color.fromRGBO(186, 99, 255, 1)
                  ])),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                ),
                child: Text(
                  "Запросить ещё раз",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )),
        ),
        SizedBox(
          height: 60,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomButton(
            nameNumber: '1',
            onPressed: first.addMeaning,
          ),
          CustomButton(
            nameNumber: '2',
            onPressed: first.addMeaning,
          ),
          CustomButton(
            nameNumber: '3',
            onPressed: first.addMeaning,
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomButton(
            nameNumber: '4',
            onPressed: first.addMeaning,
          ),
          CustomButton(
            nameNumber: '5',
            onPressed: first.addMeaning,
          ),
          CustomButton(
            nameNumber: '6',
            onPressed: first.addMeaning,
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomButton(
            nameNumber: '7',
            onPressed: first.addMeaning,
          ),
          CustomButton(
            nameNumber: '8',
            onPressed: first.addMeaning,
          ),
          CustomButton(
            nameNumber: '9',
            onPressed: first.addMeaning,
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 70,
            ),
            CustomButton(
              nameNumber: '0',
              onPressed: first.addMeaning,
            ),
            CustomButton(
              nameNumber: '',
              onPressed: first.deleteMeaning,
            ),
          ],
        ),
      ]),
    ));
  }
}
