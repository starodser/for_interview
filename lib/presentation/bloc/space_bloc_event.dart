import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SpaceEvent extends Equatable {
  const SpaceEvent();
}

class LoadSpaceEvent extends SpaceEvent {
  @override
  List<Object?> get props => [];
}
