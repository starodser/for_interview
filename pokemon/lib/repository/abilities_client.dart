// import 'package:dio/dio.dart';
// import 'package:pokemon/models/pokemon.dart';

// import 'dio.dart';

// class AbilitiesClient extends DioClient {
//   Future<Iterable<Abilities>> getAbilities(String url) async {
//     Iterable<Abilities> abilities;

//     final Response response = await dio.get(url);
//     List ability = response.data['abilities'];
//     abilities = ability.map<Abilities>((e) {
//       return Abilities.fromJson(e);
//     }).toList();
//     for (var data in abilities) {
//       print(data.ability!.name);
//     }
//     return abilities;
//   }
// }
