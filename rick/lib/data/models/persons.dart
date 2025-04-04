import 'package:rick/data/models/persona.dart';

class Persons {
  final List<Persona> persons;
  final int totalPage;


  Persons({
    required this.persons,
    required this.totalPage,

  });

  factory Persons.fromJson(Map<String, dynamic> json) {
    final persons = (json['results'] as List)
        .map((person) => Persona.fromJson(person))
        .toList();
    
    return Persons(
      persons: persons,
      totalPage: json['info']['count'],
    );
  }
}