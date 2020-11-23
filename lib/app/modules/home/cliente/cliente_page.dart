import 'dart:async';
import 'package:biodriver/app/modules/home/widgets/widgets_widget.dart';
import 'package:biodriver/app/modules/model/sequencia_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'cliente_controller.dart';

class ClientePage extends StatefulWidget {
  final String title;
  final SequenciaModel seq;
  const ClientePage({Key key, this.title = "Cliente", this.seq})
      : super(key: key);

  @override
  _ClientePageState createState() => _ClientePageState();
}

class _ClientePageState extends ModularState<ClientePage, ClienteController> {
  //use 'controller' variable to access controller
  Completer<GoogleMapController> mapController = Completer();

  @override
  void initState() {
    driverMarker();
    getClient();
    super.initState();
  }

  getClient() async {
    await controller.getClient(widget.seq.cliente);
    await controller.getGestor();
  }

  Set<Marker> marcadores = {};
  void driverMarker() {
    Set<Marker> marcadoreslocal = {};
    Marker marker = Marker(
      markerId: MarkerId('DriverMarker'),
      position: LatLng(
          double.tryParse(widget.seq.lat), double.tryParse(widget.seq.long)),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueBlue,
      ),
    );
    marcadoreslocal.add(marker);
    marcadores = marcadoreslocal;
  }

  @override
  Widget build(BuildContext context) {
    var seq = widget.seq;

    double lat = double.tryParse(seq.lat);
    double lng = double.tryParse(seq.long);
    final LatLng center = LatLng(lat, lng);

    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(seq.clienteNome),
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Modular.to.pop();
            }),
      ),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              height: sh,
              color: Colors.green,
              child: GoogleMap(
                zoomControlsEnabled: false,
                buildingsEnabled: true,
                liteModeEnabled: false,
                initialCameraPosition:
                    CameraPosition(target: center, zoom: 18.0, tilt: 45.0),
                onMapCreated: (GoogleMapController _controller) {
                  mapController.complete(_controller);
                  driverMarker();
                },
                markers: marcadores,
              ),
            ),
          ),
          Observer(
            builder: (context) {
              if (controller.gestor.email != null) {
                return AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  bottom: controller.opencard == false ? -sh * 0.83 : -sh * 0.1,
                  curve: Curves.easeOutBack,
                  // bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: sh * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(sw * 0.08),
                        ),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.black45,
                              offset: Offset(2, -2))
                        ]),
                    child: Column(
                      children: [
                        Container(
                          height: sh * 0.08,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(sw * 0.08))),
                          child: Center(
                            child: FlatButton(
                                onPressed: () {
                                  controller.opencard = !controller.opencard;
                                },
                                child: Icon(Icons.menu)),
                          ),
                        ),
                        Divider(),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: sw * 0.04),
                          padding: EdgeInsets.symmetric(
                              horizontal: sw * 0.03, vertical: sh * 0.02),
                          width: sw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.cliente.fantasia,
                                style: TextStyle(
                                    fontSize: sh * 0.025,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: sh * 0.03,
                              ),
                              Wrap(
                                children: [
                                  Text(
                                    '${controller.cliente.logradouro} - ',
                                    style: TextStyle(
                                        fontSize: sh * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.cliente.bairro,
                                    style: TextStyle(
                                        fontSize: sh * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Wrap(
                                children: [
                                  Text(
                                    '${controller.cliente.municipio} - ',
                                    style: TextStyle(
                                        fontSize: sh * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.cliente.estado,
                                    style: TextStyle(
                                        fontSize: sh * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: sw * 0.04, vertical: sh * 0.02),
                          padding: EdgeInsets.symmetric(
                              horizontal: sw * 0.03, vertical: sh * 0.02),
                          width: sw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                children: [
                                  Text(
                                    '${controller.gestor.firstName} - ',
                                    style: TextStyle(
                                        fontSize: sh * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${controller.gestor.fone}',
                                    style: TextStyle(
                                        fontSize: sh * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: sh * 0.2,
                              ),
                              Container(
                                height: sh * 0.3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    seq.iniciada == true
                                        ? FlatButton(
                                            onPressed: () {
                                              seq.visitou = true;
                                              setState(() {});
                                              controller.visitou(
                                                  seq.id, seq.visitou);
                                              showAlertDialog1(context, seq);
                                            },
                                            child: Icon(
                                              Icons.add_location,
                                              size: sw * 0.08,
                                            ),
                                          )
                                        : SizedBox(),
                                    FlatButton(
                                      onPressed: () {
                                        seq.iniciada = true;
                                        setState(() {});
                                        controller.getLocation(
                                            seq.id, seq.iniciada);

                                        var lat = double.tryParse(seq.lat);
                                        var long = double.tryParse(seq.long);
                                        LaunchMap().openMapsSheet(context, lat,
                                            long, seq.clienteNome);
                                        print(seq.iniciada);
                                      },
                                      child: Icon(
                                        Icons.navigation,
                                        size: sw * 0.08,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  height: sh,
                );
              }
            },
          )
        ],
      ),
    );
  }

  showAlertDialog1(BuildContext context, SequenciaModel seq) {
    seq = seq;
    // configura o button
    Widget coletou = FlatButton(
      child: Text("COLETOU"),
      onPressed: () {
        Modular.to.pop();
        showAlertDialog2(context, seq);
      },
    );
    Widget nColetou = FlatButton(
      child: Text("NÃO COLETOU"),
      onPressed: () {
        seq.finalizada = true;
        controller.finalizada(seq.id, seq.finalizada);
        controller.coletou(seq.id, seq.coletou);
        Modular.to.pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      content: Row(
        children: [nColetou, coletou],
      ),
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  showAlertDialog2(BuildContext context, SequenciaModel seq) {
    // configura o button
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    Widget nColetou = FlatButton(
      child: Text("Salvar"),
      onPressed: () async {
        seq.coletou = true;
        setState(() {});
        seq.finalizada = true;
        await controller.addFields(seq.id);
        print(controller.bombonas);
        controller.finalizada(seq.id, seq.finalizada);
        controller.coletou(seq.id, seq.coletou);
        Modular.to.pop();
      },
    );
    Widget coletou = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {
        controller.coletou(seq.id, seq.coletou);
        setState(() {});
        Modular.to.pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          height: sh * 0.9,
          width: sw * 0.9,
          child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: sh * 0.02,
                horizontal: sw * 0.06,
              ),
              child: Observer(
                builder: (context) {
                  return Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          controller.sacolas = int.tryParse(value);
                        },
                        keyboardType:
                            TextInputType.numberWithOptions(signed: false),
                        decoration: InputDecoration(
                          hintText: 'Sacolas',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: sh * 0.02,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          controller.sacolasBio = int.tryParse(value);
                        },
                        keyboardType:
                            TextInputType.numberWithOptions(signed: false),
                        decoration: InputDecoration(
                          hintText: 'Sacolas Bio',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: sh * 0.02,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          controller.tambores = int.tryParse(value);
                        },
                        keyboardType:
                            TextInputType.numberWithOptions(signed: false),
                        decoration: InputDecoration(
                          hintText: 'Tambores',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: sh * 0.02,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          controller.bombonas = int.tryParse(value);
                        },
                        keyboardType:
                            TextInputType.numberWithOptions(signed: false),
                        decoration: InputDecoration(
                          hintText: 'Bombonas',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: sh * 0.02,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          controller.latas = int.tryParse(value);
                        },
                        keyboardType:
                            TextInputType.numberWithOptions(signed: false),
                        decoration: InputDecoration(
                          hintText: 'Latas',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: sh * 0.02,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          controller.bags = int.tryParse(value);
                        },
                        keyboardType:
                            TextInputType.numberWithOptions(signed: false),
                        decoration: InputDecoration(
                          hintText: 'BAGS',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: sh * 0.02,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          controller.receptor = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Receptor',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  );
                },
              )),
        ),
      ),
      actions: [coletou, nColetou],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
