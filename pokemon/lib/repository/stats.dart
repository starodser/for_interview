import 'package:dio/dio.dart';

import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/repository/dio.dart';

class AbilitiesClient extends DioClient {
  Future<Iterable<Stats>> getStats(String url) async {
    Iterable<Stats> stats;

    final Response response = await dio.get(url);
    List ability = response.data['stats'];
    stats = ability.map<Stats>((e) {
      return Stats.fromJson(e);
    }).toList();
    for (var data in stats) {
      print(data.stat!.name);
    }
    return stats;
  }
}
