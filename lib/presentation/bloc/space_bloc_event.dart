import 'package:flutter/material.dart';

@immutable
abstract class SpaceEvent {}

class LoadSpaceEvent extends SpaceEvent {}

class ClearSpaceEvent extends SpaceEvent {}
