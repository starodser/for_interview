import 'package:rick/data/models/persona.dart';

abstract interface class PersonaRepository {
  Future<List<Persona>> getPerson();
  List<Persona> persons = [];
}
