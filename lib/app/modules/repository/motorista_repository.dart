import 'dart:convert';

import 'package:biodriver/app/modules/model/motorista_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
part 'motorista_repository.g.dart';

@Injectable()
class MotoristaRepository extends Disposable {
  List<MotoristaModel> motoristaModel = [];
  MotoristaModel motorista;
  Future<MotoristaModel> getMotorista(id) async {
    var response = await http
        .get("http://multidev.com.br/biotrack/api/motoristas/?user=$id");
    var decode = json.decode(response.body) as List;
    decode.forEach((element) {
      motoristaModel.add(
        MotoristaModel.fromJson(
          element,
        ),
      );
    });
    print(motoristaModel.first.nome);
    motorista = motoristaModel.first;
    return motorista;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
