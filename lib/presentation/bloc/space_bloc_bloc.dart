import './space_bloc_state.dart';
import './space_bloc_event.dart';
import '../../repository/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpaceBloc extends Bloc<SpaceEvent, SpaceState> {
  final SpaceRepositoryApi spaceRepository;

  SpaceBloc(this.spaceRepository) : super(SpaceLoadingState()) {
    on<LoadSpaceEvent>((event, emit) async {
      emit(SpaceLoadingState());
      try {
        final _space = await spaceRepository.getImage();
        emit(SpaceLoadedState(_space));
      } catch (e) {
        emit(SpaceErrorState(e.toString()));
      }
    });
  }
}
