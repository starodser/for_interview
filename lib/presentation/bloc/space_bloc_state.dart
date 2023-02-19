import '../../data/models.dart';

import 'package:flutter/material.dart';

@immutable
abstract class SpaceState {} //extends Equatable

class SpaceEmptyState extends SpaceState {}

class SpaceLoadingState extends SpaceState {}

class SpaceLoadedState extends SpaceState {
   List<SolarFlame> loadedSpace;

  SpaceLoadedState(
      {required this.loadedSpace}) : assert(loadedSpace != null);
}

class SpaceErrorState extends SpaceState {
  
}
