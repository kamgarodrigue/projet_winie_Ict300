class Jour {
  String? intitule;
  int? id;
  bool? ischecked;
  Jour({required this.id, required this.intitule, this.ischecked});

  factory Jour.fromJson(Map<String, dynamic> json) =>
      Jour(id: json["id"], intitule: json["intitule"], ischecked: false);
}
