import 'package:ricky/data/models/info_page.dart';

class PersonsPage<Persona> {
  final InfoPage info;
  final List<Persona> results;

  PersonsPage({
    required this.info,
    required this.results,
  });

  factory PersonsPage.fromJson(
    Map<String, dynamic> json,
    Persona Function(dynamic) fromJsonT,
  ) {
    return PersonsPage<Persona>(
      info: InfoPage.fromJson(json['info']),
      results: (json['results'] as List).map(fromJsonT).toList(),
    );
  }
}