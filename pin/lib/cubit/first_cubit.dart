import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'first_state.dart';

class FirstCubit extends Cubit<FirstInitial> {
  FirstCubit()
      : super(FirstInitial(meaning: [
          '',
          '',
          '',
          '',
        ]));
  void addMeaning(String a) {
    final list = state.meaning;
    var result = list.indexWhere((item) => item.isEmpty);
    if (result < 4) {
      list[result] = a;
    } else if (result == -1) {
      list[3];
    }

    return emit(FirstInitial(meaning: list));
  }

  void deleteMeaning(a) {
    final list = state.meaning;
    var lastIndex = list.lastIndexWhere((item) => item.isNotEmpty);
    if (lastIndex < 0) {
      list[3] = a;
    }
    list[lastIndex] = a;
    return emit(FirstInitial(meaning: list));
  }
}
