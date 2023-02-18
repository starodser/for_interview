import 'dart:convert';

import '../data/models.dart';
import 'package:http/http.dart' as http;

class SpaceRepositoryApi {
  String userUrl = 'https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY';

  Future<BackImage> getImage() async {
    final response = await http.get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print(result);
      return result.map((e) => BackImage.fromJson(e));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

class SpaceRepository {
  SpaceRepositoryApi _spaceRepository = SpaceRepositoryApi();
  Future<BackImage> getUser() => _spaceRepository.getImage();
}
