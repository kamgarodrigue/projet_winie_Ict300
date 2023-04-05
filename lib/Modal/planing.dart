class Planing {
  int? id;
  String? hauraire, evenement, jour, sale;
  Planing(
      {required this.id,
      required this.evenement,
      required this.hauraire,
      required this.jour,
      required this.sale});
  factory Planing.fromJson(Map<String, dynamic> json) => Planing(
      id: json['id'],
      evenement: json["evenement"],
      hauraire: json["hauraire"],
      jour: json["jour"],
      sale: json['sale']);
}
