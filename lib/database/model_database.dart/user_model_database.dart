// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

class UserDatabase {
  int id;
  String name;
  String username;
  String password;

  UserDatabase({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
  });
}
