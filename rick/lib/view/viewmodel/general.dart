import 'package:flutter/material.dart';
import 'package:rick/data/models/persona.dart';
import 'package:rick/domen/repositories/persons_impl.dart';

class First extends ChangeNotifier {
  PersonsRepositoryImpl personsRepositoryImpl = PersonsRepositoryImpl();
  List<Persona> _persons = [];
  List<Persona> get persons => _persons;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _error = '';
  String get error => _error;

  int _currentPage = 1;

  Future<void> loadPersons() async {
    if (_isLoading) return;

    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final newCharacters = await personsRepositoryImpl.getPersons(
        _currentPage,
      );
      _persons.addAll(newCharacters);
      _currentPage++;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshPersons() async {
    _currentPage = 1;
    _persons.clear();
    await loadPersons();
  }
}
