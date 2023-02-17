import 'dart:convert';

import '../data/models.dart';
import 'package:http/http.dart';

class UserRepository {
  String userUrl = 'https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY';

  Future<List<BackImage>> getImage() async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      print(response.body);
      return result.map((e) => BackImage.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
