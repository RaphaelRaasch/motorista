import 'package:shared_preferences/shared_preferences.dart';

import 'model/user_model.dart';

class DB {
  Future setToken(token, email, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', token);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    print(prefs.getString('email'));
    print(prefs.getString('password'));
  }
}
