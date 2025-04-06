import 'package:ricky/data/models/persona.dart';

class PersonaState {
  final List<Persona> persons;
  final List<Persona> favorites;
  final bool isLoading;
  final String? error;

  PersonaState({
    required this.persons,
    required this.favorites,
    required this.isLoading,
    this.error,
  });

  factory PersonaState.initial() =>
      PersonaState(persons: [], favorites: [], isLoading: false);

  PersonaState copyWith({
    List<Persona>? persons,
    List<Persona>? favorites,
    bool? isLoading,
    String? error,
  }) {
    return PersonaState(
      persons: persons ?? this.persons,
      favorites: favorites ?? this.favorites,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
