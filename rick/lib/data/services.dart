import 'package:dio/dio.dart';
import 'package:ricky/data/models/persona.dart';
import 'package:ricky/data/models/persons_page.dart';


class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api/'));

  Future<PersonsPage<Persona>> getPersons(int page) async {
    try {
      final response = await _dio.get('character', queryParameters: {'page': page});
      return PersonsPage<Persona>.fromJson(response.data,(json) => Persona.fromJson(json),
      );
    } catch (e) {
      throw Exception('Failed to load Personas');
    }
  }
}