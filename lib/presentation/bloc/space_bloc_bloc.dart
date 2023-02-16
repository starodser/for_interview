import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'space_bloc_event.dart';
part 'space_bloc_state.dart';

class SpaceBlocBloc extends Bloc<SpaceBlocEvent, SpaceBlocState> {
  SpaceBlocBloc() : super(SpaceBlocInitial()) {
    on<SpaceBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
