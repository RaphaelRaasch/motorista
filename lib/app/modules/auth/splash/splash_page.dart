import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var email = prefs.getString('email');
    var password = prefs.getString('password');
    print(token);
    print(email);
    print(password);
    if (token == null) {
      await Future.delayed(Duration(seconds: 2));
      return Modular.link.pushReplacementNamed('/auth');
    } else {
      await Future.delayed(Duration(seconds: 2));
      return controller.login(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          height: sh * 0.6,
          child: Image.asset('assets/src/logo.png'),
        ),
      ),
    );
  }
}
