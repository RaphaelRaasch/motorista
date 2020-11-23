import 'package:biodriver/app/modules/model/mtr-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'sequencia_controller.dart';

class SequenciaPage extends StatefulWidget {
  final String title;
  final MtrModel mtr;
  const SequenciaPage({Key key, this.title = "Sequencia", this.mtr})
      : super(key: key);

  @override
  _SequenciaPageState createState() => _SequenciaPageState();
}

class _SequenciaPageState
    extends ModularState<SequenciaPage, SequenciaController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    seq();
    super.initState();
  }

  Future seq() async {
    await controller.getSequencia(widget.mtr.numero);
  }

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    var mtr = widget.mtr;
    return Scaffold(
      appBar: AppBar(
        title: Text(mtr.alias),
      ),
      body: Observer(
        builder: (context) {
          return ListView.builder(
            itemCount: controller.listSequencia.length,
            itemBuilder: (context, index) {
              var seq = controller.listSequencia[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: sw * 0.04, vertical: sw * 0.02),
                child: Opacity(
                  opacity: seq.finalizada == true ? 0.6 : 1,
                  child: GestureDetector(
                    onTap: () {
                      if (seq.finalizada == true) {
                        return null;
                      } else {
                        setState(() {});
                        return Modular.link
                            .pushNamed('/cliente', arguments: seq);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: seq.iniciada == true && seq.coletou == false
                            ? Colors.red
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black54,
                            offset: Offset(2, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(sw * 0.02),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: sw * 0.04, vertical: sw * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('# ${seq.id}'),
                            Divider(
                              color: Colors.black,
                            ),
                            Text(
                              seq.clienteNome,
                              style: TextStyle(fontSize: sh * 0.02),
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            Wrap(
                              children: [
                                Text('${seq.rua} - '),
                                Text(seq.bairro),
                              ],
                            ),
                            Wrap(
                              children: [
                                Text('${seq.municipio} - '),
                                Text(seq.estado),
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
