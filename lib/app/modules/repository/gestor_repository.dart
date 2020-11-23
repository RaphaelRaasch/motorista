import 'dart:convert';

import 'package:biodriver/app/modules/model/gestor_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:http/http.dart' as http;

part 'gestor_repository.g.dart';

@Injectable()
class GestorRepository extends Disposable {
  Future<GestorModel> getGestor(id) async {
    GestorModel gestor;
    var response =
        await http.get('http://multidev.com.br/biotrack/api/usuarios/$id/');
    var decode = json.decode(response.body);
    gestor = GestorModel.fromJson(decode);

    return gestor;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
