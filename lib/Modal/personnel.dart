class Personnel {
  int? id;
  String? telephone, nom, email, password, avatar;
  Personnel(
      {required this.id,
      required this.avatar,
      required this.email,
      required this.nom,
      required this.password,
      required this.telephone});

  factory Personnel.fromJson(Map<String, dynamic> json) => Personnel(
      id: json['id'],
      avatar: json['avatar'],
      email: json['email'],
      nom: json['nom'],
      password: json["password"],
      telephone: json["telephone"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatar": avatar,
        "email": email,
        "nom": nom,
        "password": password,
        "telephone": telephone
      };
}
