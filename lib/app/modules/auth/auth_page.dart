import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'auth_controller.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key key, this.title = "Auth"}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends ModularState<AuthPage, AuthController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(body: Observer(
      builder: (context) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: sw * 0.06),
              child: Column(
                children: [
                  Container(
                    height: sh * 0.3,
                    child: Image.asset('assets/src/logo.png'),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: Colors.black26,
                          offset: Offset(2, 2))
                    ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: sw * 0.02),
                      child: TextField(
                        enabled: controller.loading == true ? false : true,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          controller.email = value;
                        },
                        decoration: InputDecoration(
                          labelText: "E-mail",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sh * 0.03,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: Colors.black26,
                          offset: Offset(2, 2))
                    ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: sw * 0.02),
                      child: TextField(
                        enabled: controller.loading == true ? false : true,
                        obscureText: true,
                        onChanged: (value) {
                          controller.password = value;
                        },
                        decoration: InputDecoration(
                          labelText: "Password",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sh * 0.05,
                  ),
                  controller.loading == false
                      ? FlatButton(
                          onPressed: () {
                            controller.login();
                          },
                          child: Text(
                            "ENTRAR",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: sh * 0.02,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      : CircularProgressIndicator()
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
