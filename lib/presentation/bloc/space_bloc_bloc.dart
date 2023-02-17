import './space_bloc_state.dart';
import './space_bloc_event.dart';
import '../../repository/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpaceBloc extends Bloc<SpaceEvent, SpaceState> {
  final UserRepository _userRepository;

  SpaceBloc(this._userRepository) : super(SpaceLoadingState()) {
    on<LoadSpaceEvent>((event, emit) async {
      emit(SpaceLoadingState());
      try {
        final users = await _userRepository.getImage();
        emit(SpaceLoadedState(users));
      } catch (e) {
        emit(SpaceErrorState(e.toString()));
      }
    });
  }
}
