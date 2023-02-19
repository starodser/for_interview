import './space_bloc_state.dart';
import './space_bloc_event.dart';
import '../../repository/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models.dart';

class SpaceBloc extends Bloc<SpaceEvent, SpaceState> {
  final SpaceRepository spacesRepository;
  SpaceBloc(this.spacesRepository) : super(SpaceEmptyState());

  @override
  Stream<SpaceState> mapEventToState(SpaceEvent event) async* {
    if (event is LoadSpaceEvent) {
      yield SpaceLoadingState();
      try {
        final List<SolarFlame> loadedSolarFlameList =
            await spacesRepository.getAllSolarFlame();
        yield SpaceLoadedState(loadedSpace: loadedSolarFlameList);
      } catch (_) {
        print(_);
        yield SpaceErrorState();
      }
    } else if (event is ClearSpaceEvent) {
      yield SpaceEmptyState();
    }

    throw UnimplementedError();
  }
}
