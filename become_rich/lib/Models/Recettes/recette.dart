class Recette {
  final int id;
  final String owner;
  final List<Map<String, Map<String, dynamic>>> recettes;

  const Recette({
    required this.id,
    required this.owner,
    required this.recettes,
  });

  factory Recette.fromJson(Map<String, dynamic> json) {
    return Recette(
      id: json['id'],
      owner: json['owner'],
      recettes: json['recettes'],
    );
  }
}
