// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ClienteController = BindInject(
  (i) => ClienteController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClienteController on _ClienteControllerBase, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_ClienteControllerBase.isFormValid'))
          .value;

  final _$opencardAtom = Atom(name: '_ClienteControllerBase.opencard');

  @override
  bool get opencard {
    _$opencardAtom.reportRead();
    return super.opencard;
  }

  @override
  set opencard(bool value) {
    _$opencardAtom.reportWrite(value, super.opencard, () {
      super.opencard = value;
    });
  }

  final _$iniciadaAtom = Atom(name: '_ClienteControllerBase.iniciada');

  @override
  bool get iniciada {
    _$iniciadaAtom.reportRead();
    return super.iniciada;
  }

  @override
  set iniciada(bool value) {
    _$iniciadaAtom.reportWrite(value, super.iniciada, () {
      super.iniciada = value;
    });
  }

  final _$clienteAtom = Atom(name: '_ClienteControllerBase.cliente');

  @override
  ClienteModel get cliente {
    _$clienteAtom.reportRead();
    return super.cliente;
  }

  @override
  set cliente(ClienteModel value) {
    _$clienteAtom.reportWrite(value, super.cliente, () {
      super.cliente = value;
    });
  }

  final _$gestorAtom = Atom(name: '_ClienteControllerBase.gestor');

  @override
  GestorModel get gestor {
    _$gestorAtom.reportRead();
    return super.gestor;
  }

  @override
  set gestor(GestorModel value) {
    _$gestorAtom.reportWrite(value, super.gestor, () {
      super.gestor = value;
    });
  }

  final _$latAtom = Atom(name: '_ClienteControllerBase.lat');

  @override
  double get lat {
    _$latAtom.reportRead();
    return super.lat;
  }

  @override
  set lat(double value) {
    _$latAtom.reportWrite(value, super.lat, () {
      super.lat = value;
    });
  }

  final _$lngAtom = Atom(name: '_ClienteControllerBase.lng');

  @override
  double get lng {
    _$lngAtom.reportRead();
    return super.lng;
  }

  @override
  set lng(double value) {
    _$lngAtom.reportWrite(value, super.lng, () {
      super.lng = value;
    });
  }

  final _$sequenciaAtom = Atom(name: '_ClienteControllerBase.sequencia');

  @override
  SequenciaModel get sequencia {
    _$sequenciaAtom.reportRead();
    return super.sequencia;
  }

  @override
  set sequencia(SequenciaModel value) {
    _$sequenciaAtom.reportWrite(value, super.sequencia, () {
      super.sequencia = value;
    });
  }

  final _$sacolasAtom = Atom(name: '_ClienteControllerBase.sacolas');

  @override
  int get sacolas {
    _$sacolasAtom.reportRead();
    return super.sacolas;
  }

  @override
  set sacolas(int value) {
    _$sacolasAtom.reportWrite(value, super.sacolas, () {
      super.sacolas = value;
    });
  }

  final _$sacolasBioAtom = Atom(name: '_ClienteControllerBase.sacolasBio');

  @override
  int get sacolasBio {
    _$sacolasBioAtom.reportRead();
    return super.sacolasBio;
  }

  @override
  set sacolasBio(int value) {
    _$sacolasBioAtom.reportWrite(value, super.sacolasBio, () {
      super.sacolasBio = value;
    });
  }

  final _$tamboresAtom = Atom(name: '_ClienteControllerBase.tambores');

  @override
  int get tambores {
    _$tamboresAtom.reportRead();
    return super.tambores;
  }

  @override
  set tambores(int value) {
    _$tamboresAtom.reportWrite(value, super.tambores, () {
      super.tambores = value;
    });
  }

  final _$bombonasAtom = Atom(name: '_ClienteControllerBase.bombonas');

  @override
  int get bombonas {
    _$bombonasAtom.reportRead();
    return super.bombonas;
  }

  @override
  set bombonas(int value) {
    _$bombonasAtom.reportWrite(value, super.bombonas, () {
      super.bombonas = value;
    });
  }

  final _$bagsAtom = Atom(name: '_ClienteControllerBase.bags');

  @override
  int get bags {
    _$bagsAtom.reportRead();
    return super.bags;
  }

  @override
  set bags(int value) {
    _$bagsAtom.reportWrite(value, super.bags, () {
      super.bags = value;
    });
  }

  final _$latasAtom = Atom(name: '_ClienteControllerBase.latas');

  @override
  int get latas {
    _$latasAtom.reportRead();
    return super.latas;
  }

  @override
  set latas(int value) {
    _$latasAtom.reportWrite(value, super.latas, () {
      super.latas = value;
    });
  }

  final _$receptorAtom = Atom(name: '_ClienteControllerBase.receptor');

  @override
  String get receptor {
    _$receptorAtom.reportRead();
    return super.receptor;
  }

  @override
  set receptor(String value) {
    _$receptorAtom.reportWrite(value, super.receptor, () {
      super.receptor = value;
    });
  }

  final _$getClientAsyncAction =
      AsyncAction('_ClienteControllerBase.getClient');

  @override
  Future<dynamic> getClient(dynamic id) {
    return _$getClientAsyncAction.run(() => super.getClient(id));
  }

  final _$getGestorAsyncAction =
      AsyncAction('_ClienteControllerBase.getGestor');

  @override
  Future<dynamic> getGestor() {
    return _$getGestorAsyncAction.run(() => super.getGestor());
  }

  final _$getLocationAsyncAction =
      AsyncAction('_ClienteControllerBase.getLocation');

  @override
  Future<dynamic> getLocation(dynamic id, dynamic iniciada) {
    return _$getLocationAsyncAction.run(() => super.getLocation(id, iniciada));
  }

  final _$coletouAsyncAction = AsyncAction('_ClienteControllerBase.coletou');

  @override
  Future<dynamic> coletou(dynamic id, dynamic coletou) {
    return _$coletouAsyncAction.run(() => super.coletou(id, coletou));
  }

  final _$visitouAsyncAction = AsyncAction('_ClienteControllerBase.visitou');

  @override
  Future<dynamic> visitou(dynamic id, bool visitou) {
    return _$visitouAsyncAction.run(() => super.visitou(id, visitou));
  }

  final _$finalizadaAsyncAction =
      AsyncAction('_ClienteControllerBase.finalizada');

  @override
  Future<dynamic> finalizada(dynamic id, bool finalizada) {
    return _$finalizadaAsyncAction.run(() => super.finalizada(id, finalizada));
  }

  final _$addFieldsAsyncAction =
      AsyncAction('_ClienteControllerBase.addFields');

  @override
  Future<dynamic> addFields(dynamic id) {
    return _$addFieldsAsyncAction.run(() => super.addFields(id));
  }

  final _$_ClienteControllerBaseActionController =
      ActionController(name: '_ClienteControllerBase');

  @override
  Stream<StreamSubscription<Position>> streamPosition() {
    final _$actionInfo = _$_ClienteControllerBaseActionController.startAction(
        name: '_ClienteControllerBase.streamPosition');
    try {
      return super.streamPosition();
    } finally {
      _$_ClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
opencard: ${opencard},
iniciada: ${iniciada},
cliente: ${cliente},
gestor: ${gestor},
lat: ${lat},
lng: ${lng},
sequencia: ${sequencia},
sacolas: ${sacolas},
sacolasBio: ${sacolasBio},
tambores: ${tambores},
bombonas: ${bombonas},
bags: ${bags},
latas: ${latas},
receptor: ${receptor},
isFormValid: ${isFormValid}
    ''';
  }
}
