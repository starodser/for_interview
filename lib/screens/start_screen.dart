import 'package:flutter/material.dart';
import 'package:for_interview/data/models.dart';
import '../presentation/bloc/space_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/bloc/space_bloc_state.dart';
import '../repository/repositories.dart';
import './widgets/start_button.dart';
import 'widgets/solar_flame_list.dart';
import '../presentation/bloc/space_bloc_bloc.dart';

class StartScreen extends StatelessWidget {
  final spacesRepository = SpaceRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SpaceBloc>(
          create: (context) => SpaceBloc(spacesRepository),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text('The Solar Flame',
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://apod.nasa.gov/apod/image/2302/Pleiades_WiseAntonucci_960.jpg",
                    scale: 1),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 7,
                ),
                StartButton(),
                SizedBox(
                  height: 7,
                ),
                Expanded(
                  child: SolarFlameList(),
                )
              ],
            )),
      ),
    );
  }
}
