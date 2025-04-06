import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ricky/data/models/persona.dart';
import 'package:ricky/data/repositories/persona_repository.dart';
import 'package:ricky/data/services.dart';
import 'package:ricky/domen/entity_persona.dart';

// Провайдер для ApiService
final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

// Провайдер для CharacterRepository
final personaRepositoryProvider = Provider<PersonaRepository>((ref) {
  return PersonaRepository(ref.read(apiServiceProvider));
});

final personaViewModelProvider =
    StateNotifierProvider<PersonaViewModel, PersonaState>((ref) {
      final repository = ref.read(personaRepositoryProvider);
      return PersonaViewModel(repository);
    });

class PersonaViewModel extends StateNotifier<PersonaState> {
  final PersonaRepository _repository;
  int _currentPage = 1;
  bool _hasReachedMax = false;

  PersonaViewModel(this._repository) : super(PersonaState.initial());

  Future<void> loadPersons() async {
    if (state.isLoading || _hasReachedMax) return;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _repository.getPersons(_currentPage);
      _hasReachedMax = response.info.next == null;

      state = state.copyWith(
        persons: [...state.persons, ...response.results],
        isLoading: false,
      );

      _currentPage++;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void toggleFavorite(Persona persona) {
    final isFavorite = state.favorites.any((c) => c.id == persona.id);
    final newFavorites = [...state.favorites];

    if (isFavorite) {
      newFavorites.removeWhere((c) => c.id == persona.id);
    } else {
      newFavorites.add(persona);
    }

    state = state.copyWith(favorites: newFavorites);
  }
}
