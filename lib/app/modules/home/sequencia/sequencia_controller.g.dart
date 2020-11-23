// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sequencia_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SequenciaController = BindInject(
  (i) => SequenciaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SequenciaController on _SequenciaControllerBase, Store {
  final _$listSequenciaAtom =
      Atom(name: '_SequenciaControllerBase.listSequencia');

  @override
  List<SequenciaModel> get listSequencia {
    _$listSequenciaAtom.reportRead();
    return super.listSequencia;
  }

  @override
  set listSequencia(List<SequenciaModel> value) {
    _$listSequenciaAtom.reportWrite(value, super.listSequencia, () {
      super.listSequencia = value;
    });
  }

  final _$getSequenciaAsyncAction =
      AsyncAction('_SequenciaControllerBase.getSequencia');

  @override
  Future<dynamic> getSequencia(dynamic id) {
    return _$getSequenciaAsyncAction.run(() => super.getSequencia(id));
  }

  @override
  String toString() {
    return '''
listSequencia: ${listSequencia}
    ''';
  }
}
