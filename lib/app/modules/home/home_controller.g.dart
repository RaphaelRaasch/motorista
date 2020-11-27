// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$motoristaAtom = Atom(name: '_HomeControllerBase.motorista');

  @override
  MotoristaModel get motorista {
    _$motoristaAtom.reportRead();
    return super.motorista;
  }

  @override
  set motorista(MotoristaModel value) {
    _$motoristaAtom.reportWrite(value, super.motorista, () {
      super.motorista = value;
    });
  }

  final _$listMtrAtom = Atom(name: '_HomeControllerBase.listMtr');

  @override
  List<MtrModel> get listMtr {
    _$listMtrAtom.reportRead();
    return super.listMtr;
  }

  @override
  set listMtr(List<MtrModel> value) {
    _$listMtrAtom.reportWrite(value, super.listMtr, () {
      super.listMtr = value;
    });
  }

  final _$getMotoristaAsyncAction =
      AsyncAction('_HomeControllerBase.getMotorista');

  @override
  Future<dynamic> getMotorista(dynamic id) {
    return _$getMotoristaAsyncAction.run(() => super.getMotorista(id));
  }

  final _$getMtrAsyncAction = AsyncAction('_HomeControllerBase.getMtr');

  @override
  Future<dynamic> getMtr() {
    return _$getMtrAsyncAction.run(() => super.getMtr());
  }

  final _$exitAsyncAction = AsyncAction('_HomeControllerBase.exit');

  @override
  Future exit() {
    return _$exitAsyncAction.run(() => super.exit());
  }

  @override
  String toString() {
    return '''
motorista: ${motorista},
listMtr: ${listMtr}
    ''';
  }
}
