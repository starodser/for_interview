import 'dart:convert';

import '../data/models.dart';
import 'package:http/http.dart' as http;

class SpaceRepositoryApi {
  Future<List<SolarFlame>> getSolarFlame() async {
    final response = await http.get(Uri.parse(
        'https://kauai.ccmc.gsfc.nasa.gov/DONKI/WS/get/FLR?startDate=2023-02-12&endDate=2023-02-20'));
    if (response.statusCode == 200) {
      final List<dynamic> result = json.decode(response.body);
      return result.map((json) => SolarFlame.fromJson(json)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

class SpaceRepository {
  final SpaceRepositoryApi _spacesRepository = SpaceRepositoryApi();
  Future<List<SolarFlame>> getAllSolarFlame() =>
      _spacesRepository.getSolarFlame();
}
