import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.accounts,
    this.age,
    this.name,
  });

  List<int> accounts;
  int age;
  String name;

  factory User.fromJson(Map<String, dynamic> json) => User(
        accounts: List<int>.from(json["accounts"].map((x) => x)),
        age: json["age"],
        name: json["name"],
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  Map<String, dynamic> toJson() => {
        "accounts": List<dynamic>.from(accounts.map((x) => x)),
        "age": age,
        "name": name,
      };
}
