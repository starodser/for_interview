import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick/data/models/persona.dart';
import 'package:rick/view/viewmodel/general.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final First _viewModel;
  final ScrollController _scrollController = ScrollController();
  
    @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<First>(context, listen: false);
    _viewModel.loadPersons();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _viewModel.loadPersons();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
         onRefresh: () => _viewModel.refreshPersons(),
        child: Consumer<First>(
          builder: (context, viewModel, child) {
            if (viewModel.error.isNotEmpty) {
                            return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: ${viewModel.error}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: viewModel.refreshPersons,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }
            if (viewModel.persons.isEmpty && viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
              return ListView.builder(
                controller: _scrollController,
                itemCount: viewModel.persons.length + (viewModel.isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                                if (index < viewModel.persons.length) {
                  final person = viewModel.persons[index];
                  return MyCard(person: person);
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                
                           };
              
            });
          },
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
   final Persona person;

  const MyCard({super.key, required this.person});
  @override
  Widget build(BuildContext context) {
   return Padding(
                    padding: const EdgeInsets.all(27.0),
                    child: ListTile(
                      leading: Image.network(person.pathImage),
                      title: Text(person.name),
                      subtitle: Text(
                        ' ${person.species}, ${person.status}',
                        style: TextStyle(
                          color:
                              person.status == 'Alive'
                                  ? Colors.green
                                  : Colors.red,
                        ),
                      ),
                    ),
                  );
    
  }
}