import 'dart:convert';

import 'package:biodriver/app/modules/model/cliente_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:http/http.dart' as http;

part 'cliente_repository.g.dart';

@Injectable()
class ClienteRepository extends Disposable {
  Future<ClienteModel> getClient(id) async {
    ClienteModel cliente;
    var response =
        await http.get('http://multidev.com.br/biotrack/api/clientes/$id/');
    var decode = json.decode(response.body);
    cliente = ClienteModel.fromJson(decode);

    return cliente;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
