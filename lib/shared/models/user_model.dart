import 'dart:convert';

class User {
  final String name;
  final String? photoUrl;

  User({required this.name, this.photoUrl});

  toMap() => {"name": name, "phtoUrl": photoUrl};

  String toJson() => jsonEncode(toMap());

  factory User.fromMap(Map<String, dynamic> map) {
    return User(name: map['name'], photoUrl: map['photoUrl']);
  }

  factory User.fromJson(String json) => User.fromMap(jsonDecode(json));
}
