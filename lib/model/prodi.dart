class Prodi {
  final int id;
  final String name;

  Prodi({required this.id, required this.name});
  
  factory Prodi.fromMap(Map<String, dynamic> map) {
    return Prodi(
      id: map['id'], // Access 'id' from the map
      name: map['name'], // Access 'name' from the map
    );
  }

    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

}
