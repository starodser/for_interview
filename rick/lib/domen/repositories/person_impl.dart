import 'package:dio/dio.dart';
import 'package:rick/data/models/persona.dart';
import 'package:rick/data/repositories/persona.dart';
import 'package:rick/routes.dart';


class PersonaRepositoryImpl implements PersonaRepository {
  final Dio _dio = Dio();
  bool more = true;
  @override
  List<Persona> persons =[];

  @override
  Future<List<Persona>> getPerson({int page = 1}) async {
   try {
      final Response response = await _dio.get('${Routes.host}', queryParameters: {'page': page});
      final data = response.data['results'] as List;
      return data.map((json) => Persona.fromJson(json as Map<String, dynamic>)).toList();
      
    }  catch (e) {
      throw ('Failed to fetch posts: ${e}',);
    }
  }
}