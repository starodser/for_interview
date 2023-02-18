import 'package:flutter/material.dart';
import '../presentation/bloc/space_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/bloc/space_bloc_state.dart';
import '../repository/repositories.dart';

class HomePage extends StatelessWidget {
  final spaceRepository = SpaceRepositoryApi();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SpaceBloc>(
            create: (context) => SpaceBloc(spaceRepository),
          ),
        ],
        child: Scaffold(
            appBar: AppBar(title: const Text('The App')),
            body: BlocBuilder<SpaceBloc, SpaceState>(
              builder: (context, state) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image(
                          width: 300,
                          height: 500,
                          image: NetworkImage(
                              "https://apod.nasa.gov/apod/image/2302/JWSTMIRI_ngc1365_1024.png",
                              scale: 1),
                        ),
                      ),
                      Text(state.toString())
                    ],
                  ),
                );
              },
            )));
  }
}
  // Center(
  //   child: Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Expanded(
  //         child: const Image(
  //             width: 300,
  //             height: 500,
  //             image: NetworkImage(
  //                 "https://apod.nasa.gov/apod/image/2302/JWSTMIRI_ngc1365_1024.png",
  //                 scale: 1)),
  //         // child: Image.network(
  //         //     'https://apod.nasa.gov/apod/image/2302/JWSTMIRI_ngc1365_1024.png'),
  //       ),
  //          Text(
  //         'Hi',
  //         // '$_counter',
  //         style: Theme.of(context).textTheme.headline4,
  //       ),
  //     ],
  //   ),
  // ),

