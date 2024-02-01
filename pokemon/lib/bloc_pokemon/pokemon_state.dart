part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class GetPokemonNameState extends PokemonState {
  String? rand;
  Iterable<Stats>? abilities;

  //final String rand;
  GetPokemonNameState({required this.rand, required this.abilities});
}
