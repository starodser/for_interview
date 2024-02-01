part of 'first_cubit.dart';

@immutable
abstract class FirstState {}

class FirstInitial extends FirstState {
  List<String> meaning;
  FirstInitial({required this.meaning});
}
