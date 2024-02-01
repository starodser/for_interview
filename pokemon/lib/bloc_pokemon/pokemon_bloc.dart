import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/models/results.dart';
import 'package:pokemon/repository/abilities_client.dart';
import 'package:pokemon/repository/pokemon.dart';
import 'package:pokemon/repository/stats.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonClient pokemonRepository = PokemonClient();
  List<Results>? pokemonNameList = [];
  String? rand;
  AbilitiesClient abilitiesClient = AbilitiesClient();
  Iterable<Stats> abilities = [];
  String? hp;
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonEvent>((event, emit) {});

    on<GetPokemonNameEvent>((event, emit) async {
      pokemonNameList = await pokemonRepository.getFetch();
      var rand =
          pokemonNameList?[Random().nextInt(pokemonNameList!.length)]; //.name;
      // print(rand);
      //print(pokemonNameList);
      abilities = await abilitiesClient.getStats(rand!.url.toString());
      for (var data in abilities) {
        print(data.stat!.name);
      }
      emit(GetPokemonNameState(rand: rand.name, abilities: abilities));
    });

    on<CharacterFeaturesEvent>((event, emit) async {
      abilities = await abilitiesClient.getStats(event.url);
      emit(state);
      //print(state);
      //  print(abilities);
    });
  }
}
