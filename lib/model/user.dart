import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final String? id;
  final String? name;
  final String? username;
  final String? password;
  final String? photo;
  final String? userType;
  final String? photoURL;

  User({
    this.id,
    this.name,
    this.username,
    this.password,
    this.photo,
    this.userType,
    this.photoURL,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        username: json["username"],
        password: json["password"],
        photo: json["photo"],
        userType: json["userType"],
        photoURL: json["photoURL"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "username": username,
        "password": password,
        "photo": photo,
        "userType": userType,
        "photoURL": photoURL,
      };
}
