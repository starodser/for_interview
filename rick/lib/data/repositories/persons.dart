
import 'package:rick/data/models/persona.dart';

abstract interface class PersonsRepository {
  Future<List<Persona>> getPersons(int page);
  
}
