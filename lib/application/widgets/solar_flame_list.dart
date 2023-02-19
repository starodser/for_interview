import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_interview/presentation/bloc/space_bloc_bloc.dart';
import 'package:for_interview/presentation/bloc/space_bloc_state.dart';

class SolarFlameList extends StatelessWidget {
  const SolarFlameList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpaceBloc, SpaceState>(builder: (context, state) {
      if (state is SpaceEmptyState) {
        return Center(
          child: Text(
            'Нет данных',
            style: TextStyle(fontSize: 20),
          ),
        );
      }
      if (state is SpaceLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is SpaceLoadedState) {
        return ListView.builder(
          itemCount: state.loadedSpace.length,
          itemBuilder: ((context, index) => Container(
                child: ListTile(
                  leading: Text(
                    'Klass: ${state.loadedSpace[index].classSolarFlame}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Start : ${state.loadedSpace[index].startTime}',
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                          )),
                      Text(
                        'Pick : ${state.loadedSpace[index].pickTime}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'End : ${state.loadedSpace[index].endTime}',
                        style: TextStyle(fontWeight: FontWeight.w100),
                      )
                    ],
                  ),
                ),
              )),
        );
      }
      if (state is SpaceErrorState) {
        return Center(
          child: Text(
            'Ошибка загрузки',
            style: TextStyle(fontSize: 20),
          ),
        );
      }
      return null;
    });
  }
}
