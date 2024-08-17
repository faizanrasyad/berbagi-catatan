import 'package:berbagi_catatan/model/user_model.dart';

class UserData {
  static final UserData _instance = UserData._internal();

  factory UserData() {
    return _instance;
  }

  UserData._internal();

  List<User> users = [
    User(name: 'Admin', username: 'admin', password: 'admin123'),
    User(name: 'Joko Widodo', username: 'jokowi', password: 'jokowi1')
  ];
}
