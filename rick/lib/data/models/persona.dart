class Persona {
  int id;
  String name;
  String status;
  String pathImage;
  String species;
  bool isFavorite; 
 Persona({this.isFavorite = false,required this.id,required this.name,required this.status,required this.pathImage, required this.species});

   factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      pathImage: json['image'],
     species: json['species'],
      isFavorite: false,
     );
  }
}