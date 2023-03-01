import 'package:flutter/material.dart';
import '../../presentation/bloc/space_bloc_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/bloc/space_bloc_bloc.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final SpaceBloc spaceBloc = context.read<SpaceBloc>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            spaceBloc.add(LoadSpaceEvent());
          },
          child: Text('Load'),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.amber),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        ElevatedButton(
          onPressed: () {
            spaceBloc.add(ClearSpaceEvent());
          },
          child: Text('Clear'),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.cyan),
          ),
        ),
      ],
    );
  }
}
