import 'dart:convert';
import 'package:biodriver/app/modules/model/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
part 'user_repository.g.dart';

const AUTH_URL = 'http://multidev.com.br/biotrack/auth-token/';

@Injectable()
class UserRepository extends Disposable {
  Future<UserModel> auth(email, password) async {
    try {
      var response = await http.post(
        AUTH_URL,
        body: ({'username': email, 'password': password}),
      );
      print(response.statusCode);
      print(response.body);
      var data = json.decode(response.body);
      var user = UserModel.fromJson(data);
      Modular.to.pushReplacementNamed('/home', arguments: user);
      return user;
    } catch (e) {
      print(e);
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
