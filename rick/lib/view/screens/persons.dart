import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ricky/view/widgets/card.dart';
import 'package:ricky/viewmodel/persona.dart';

class PersonsScreen extends ConsumerStatefulWidget {
  const PersonsScreen({super.key});

  @override
  ConsumerState<PersonsScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends ConsumerState<PersonsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(personaViewModelProvider.notifier).loadPersons();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ref.read(personaViewModelProvider.notifier).loadPersons();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(personaViewModelProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(personaViewModelProvider.notifier).loadPersons();
        },
        child: ListView.builder(
          controller: _scrollController,
          itemCount: state.persons.length + (state.isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < state.persons.length) {
              final persona = state.persons[index];
              return PersonaCard(
                persona: persona,
                isFavorite: state.favorites.any((c) => c.id == persona.id),
                onFavoriteTap: () => ref
                    .read(personaViewModelProvider.notifier)
                    .toggleFavorite(persona),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }
          },
        ),
      ),
    );
  }
}