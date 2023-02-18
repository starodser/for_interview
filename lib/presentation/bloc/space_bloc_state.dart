import '../../data/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SpaceState {} //extends Equatable

class SpaceLoadingState extends SpaceState {
  @override
  Object? get props => [];
}

class SpaceLoadedState extends SpaceState {
  final BackImage space;
  SpaceLoadedState(this.space);
  @override
  Object? get props => [space];
}

class SpaceErrorState extends SpaceState {
  final String error;
  SpaceErrorState(this.error);
  @override
  Object? get props => [error];
}
