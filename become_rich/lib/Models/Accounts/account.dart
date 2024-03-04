class Account {
  final int id;
  final String owner;
  final double lastSpareAmount;
  final double lastRunAmount;
  final List<Map<DateTime, double>> yearSpareAmount;
  final List<Map<DateTime, double>> yearRunAmount;

  const Account({
    required this.id,
    required this.owner,
    required this.lastSpareAmount,
    required this.lastRunAmount,
    required this.yearSpareAmount,
    required this.yearRunAmount,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      owner: json['owner'],
      lastSpareAmount: json['lastSpareAmount'],
      lastRunAmount: json['lastRunAmount'],
      yearSpareAmount: json['yearSpareAmount'],
      yearRunAmount: json['yearRunAmount'],
    );
  }
}
