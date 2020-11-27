import 'dart:convert';
import 'package:biodriver/app/modules/model/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../db.dart';
part 'user_repository.g.dart';

const AUTH_URL = 'http://multidev.com.br/biotrack/auth-token/';

@Injectable()
class UserRepository extends Disposable {
  Future auth(email, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var response = await http.post(
        AUTH_URL,
        body: ({'username': email, 'password': password}),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var user = UserModel.fromJson(data);
        var token = prefs.getString('token');
        if (token != null) {
          Modular.to.pushReplacementNamed('/home', arguments: user);
        } else {
          await DB().setToken(user.token, email, password);
          Modular.to.pushReplacementNamed('/home', arguments: user);
        }
        return user;
      } else {
        return;
      }
    } catch (e) {
      print(e);
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
