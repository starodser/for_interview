import '../../data/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SpaceState extends Equatable {}

class SpaceLoadingState extends SpaceState {
  @override
  List<Object?> get props => [];
}

class SpaceLoadedState extends SpaceState {
  final List<BackImage> users;
  SpaceLoadedState(this.users);
  @override
  List<Object?> get props => [users];
}

class SpaceErrorState extends SpaceState {
  final String error;
  SpaceErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
