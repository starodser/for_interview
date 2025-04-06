
import 'package:ricky/data/models/persona.dart';
import 'package:ricky/data/models/persons_page.dart';
import 'package:ricky/data/services.dart';

class PersonaRepository {
  final ApiService _apiService;

  PersonaRepository(this._apiService);

  Future<PersonsPage<Persona>> getPersons(int page) async {
    return await _apiService.getPersons(page);
  }
}