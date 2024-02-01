import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc_pokemon/pokemon_bloc.dart';

class RandScreen extends StatefulWidget {
  const RandScreen({super.key});

  @override
  State<RandScreen> createState() => _RandScreenState();
}

class _RandScreenState extends State<RandScreen> {
  @override
  void initState() {
    BlocProvider.of<PokemonBloc>(context)..add(GetPokemonNameEvent());
    //print(pok);
    super.initState();
  }

  @override
  //final pok = PokemonBloc();
  Widget build(BuildContext context) {
    //final pokemons = context.select((PokemonBloc bloc) => bloc.state);
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              BlocBuilder<PokemonBloc, PokemonState>(builder: (ctx, state) {
                if (state is GetPokemonNameState) {
                  return ExpansionTile(
                      title: Text(
                        state.rand.toString(),
                        textAlign: TextAlign.center,
                      ),
                      children: [
                        Text(
                            '${state.abilities!.first.stat!.name} ${state.abilities!.first.stat!.name!.runes}')
                      ]);
                }
                return Text('Hi');
              })
            ],
          ),
        ),
      ),
    );
  }
}
