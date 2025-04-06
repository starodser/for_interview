import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ricky/view/widgets/card.dart';
import 'package:ricky/viewmodel/persona.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(personaViewModelProvider).favorites;

    return Scaffold(
      body: favorites.isEmpty
          ? const Center(child: Text('No favorites yet'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final persona = favorites[index];
                return PersonaCard(
                  persona: persona,
                  isFavorite: true,
                  onFavoriteTap: () => ref
                      .read(personaViewModelProvider.notifier)
                      .toggleFavorite(persona),
                );
              },
            ),
    );
  }
}
