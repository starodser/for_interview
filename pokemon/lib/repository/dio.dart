import 'package:dio/dio.dart';

class DioClient {
  Dio dio = Dio();

  final String charUrl =
      'https://pokeapi.co/api/v2/pokemon?offset=0&limit=2000';
}
