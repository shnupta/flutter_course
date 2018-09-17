import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_course/models/user.dart';

class UserModel extends Model {
  User _authenticatedUser;

  void login(String email, String password) {
    _authenticatedUser = new User(id: 'asdfsad', email: email, password:  password);
  }
}