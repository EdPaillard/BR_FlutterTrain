class Depense {
  final int id;
  final String owner;
  final List<Map<String, Map<String, dynamic>>> depenses;

  const Depense({
    required this.id,
    required this.owner,
    required this.depenses,
  });

  factory Depense.fromJson(Map<String, dynamic> json) {
    return Depense(
      id: json['id'],
      owner: json['owner'],
      depenses: json['depenses'],
    );
  }
}
