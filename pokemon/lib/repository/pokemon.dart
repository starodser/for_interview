import 'package:dio/dio.dart';
import 'package:pokemon/models/results.dart';
import 'package:pokemon/repository/dio.dart';

class PokemonClient extends DioClient {
  Future<List<Results>>? getFetch() async {
    List<Results> pokeList = [];

    final Response response = await dio.get(charUrl);
    List poke = response.data['results'] as List;
    pokeList = poke.map<Results>((e) {
      return Results.fromJson(e);
    }).toList();

    // for (var pokeName in pokeList) {
    //   print(pokeName.name);
    // }
    return pokeList;
  }
}
