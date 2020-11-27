import 'package:biodriver/app/modules/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  final UserModel user;
  const HomePage({Key key, this.title = "Home", this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    iniciar();
    super.initState();
  }

  Future iniciar() async {
    await controller.getMotorista(widget.user.userId);
    await controller.getMtr();
  }

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    var user = widget.user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(user.firstName),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                controller.exit();
              })
        ],
      ),
      body: Observer(
        builder: (context) {
          if (controller.listMtr != null) {
            return ListView.builder(
              itemCount: controller.listMtr.length,
              itemBuilder: (context, index) {
                var mtr = controller.listMtr[index];
                return GestureDetector(
                  onTap: () {
                    Modular.link.pushNamed('/sequencia', arguments: mtr);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: sw * 0.02,
                      vertical: sw * 0.02,
                    ),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        color: Colors.black38,
                      )
                    ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: sw * 0.02, vertical: sw * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('# ${mtr.numero.toString()}'),
                          Text(
                            '${mtr.alias}',
                            style: TextStyle(fontSize: sh * 0.02),
                          ),
                          SizedBox(
                            height: sh * 0.02,
                          ),
                          Text(mtr.caminhao)
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('Nenhuma Mtr Cadastrada'),
            );
          }
        },
      ),
    );
  }
}
