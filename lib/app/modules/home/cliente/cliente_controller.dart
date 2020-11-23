import 'dart:async';

import 'package:biodriver/app/modules/home/home_controller.dart';
import 'package:biodriver/app/modules/model/gestor_model.dart';
import 'package:biodriver/app/modules/model/sequencia_model.dart';
import 'package:biodriver/app/modules/repository/cliente_repository.dart';
import 'package:biodriver/app/modules/repository/gestor_repository.dart';
import 'package:biodriver/app/modules/repository/sequencia_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:biodriver/app/modules/model/cliente_model.dart';

part 'cliente_controller.g.dart';

@Injectable()
class ClienteController = _ClienteControllerBase with _$ClienteController;

abstract class _ClienteControllerBase with Store {
  @observable
  bool opencard = false;
  @observable
  bool iniciada;
  @observable
  ClienteModel cliente = ClienteModel();
  @observable
  GestorModel gestor = GestorModel();
  final HomeController home = Modular.get();

  @action
  Future getClient(id) async {
    var response = await ClienteRepository().getClient(id);
    cliente = response;
  }

  @action
  Future getGestor() async {
    var response = await GestorRepository().getGestor(cliente.gestao);
    gestor = response;
  }

  @observable
  double lat;
  @observable
  double lng;

  @action
  Stream<StreamSubscription<Position>> streamPosition() {
    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 5,
    ).listen((Position position) {
      lat = position.latitude;
      lng = position.longitude;
      Firestore.instance
          .collection('userLocate')
          .document('Gestor ${cliente.gestao}')
          .updateData({
        'latitude': lat,
        'longitude': lng,
      });
    });
  }

  @observable
  SequenciaModel sequencia = SequenciaModel();
  @action
  Future getLocation(id, iniciada) async {
    print(home.motorista.nome);
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    lat = position.latitude;
    lng = position.longitude;
    Firestore.instance
        .collection('userLocate')
        .document('Gestor ${gestor.id}')
        .setData(
      {
        'latitude': lat,
        'longitude': lng,
        'first_name': home.motorista.nome,
        'initilized': true,
      },
    );
    streamPosition();
    await SequenciaRepository().initialize(id, iniciada);
    sequencia = await SequenciaRepository().sequenciaM(id);
  }

  @action
  Future coletou(id, coletou) async {
    await SequenciaRepository().coletou(id, coletou);
    print("Coletou");
  }

  @action
  Future visitou(id, bool visitou) async {
    await SequenciaRepository().visitou(id, visitou);
  }

  @action
  Future finalizada(id, bool finalizada) async {
    await SequenciaRepository().finalizada(id, finalizada);
  }

  @observable
  int sacolas = 0000;
  @observable
  int sacolasBio = 0000;
  @observable
  int tambores = 0000;
  @observable
  int bombonas = 0000;
  @observable
  int bags = 0000;
  @observable
  int latas = 0000;
  @observable
  String receptor = "";
  @computed
  bool get isFormValid =>
      sacolas != 0000 &&
      sacolasBio != 0000 &&
      tambores != 0000 &&
      bombonas != 0000 &&
      bags != 0000 &&
      latas != 0000 &&
      receptor.isNotEmpty;

  @action
  Future addFields(id) async {
    var response = await SequenciaRepository().fields(
        id, sacolas, sacolasBio, tambores, bombonas, bags, latas, receptor);
    print(response);
  }
}
