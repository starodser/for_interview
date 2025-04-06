import 'package:flutter/material.dart';
import 'package:ricky/data/models/persona.dart';

class PersonaCard extends StatelessWidget {
  final Persona persona;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const PersonaCard({
    super.key,
    required this.persona,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          (persona.image),
        ),
        title: Text(persona.name),
        subtitle: Text('${persona.species} - ${persona.status}',
                                style: TextStyle(
                          color:
                              persona.status == 'Alive'
                                  ? Colors.green
                                  : Colors.red,),),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
          ),
          onPressed: onFavoriteTap,
        ),
      ),
    );
  }
}