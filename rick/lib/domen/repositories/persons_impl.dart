import 'package:dio/dio.dart';
import 'package:rick/data/models/persona.dart';
import 'package:rick/data/models/persons.dart';
import 'package:rick/data/repositories/persons.dart';
import 'package:rick/routes.dart';

class PersonsRepositoryImpl implements PersonsRepository{
  final Dio _dio = Dio();
  final int _currentPage = 1;
  @override
   Future<List<Persona>>getPersons(int page) async {
    try {
      final response = await _dio.get(Routes.persons(_currentPage));
     return Persons.fromJson(response.data).persons;
    } on DioException catch (e) {
      throw Exception('Failed to load characters: ${e.message}');
    }
  }

}