import './space_bloc_state.dart';
import './space_bloc_event.dart';
import '../../repository/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models.dart';

class SpaceBloc extends Bloc<SpaceEvent, SpaceState> {
  final SpaceRepository spacesRepository;
  SpaceBloc(this.spacesRepository) : super(SpaceEmptyState()) {
    on<LoadSpaceEvent>((event, emit) async {
      emit(SpaceLoadingState());
      try {
        final List<SolarFlame> loadedSolarFlameList =
            await spacesRepository.getAllSolarFlame();
        emit(SpaceLoadedState(loadedSpace: loadedSolarFlameList));
      } catch (_) {
        emit(SpaceErrorState());
      }
    });
    on<ClearSpaceEvent>((event, emit) async {
      emit(SpaceEmptyState());
    });
  }
}
