import 'dart:convert';

import 'package:biodriver/app/modules/model/sequencia_model.dart';
import 'package:biodriver/app/modules/model/status_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:http/http.dart' as http;

part 'sequencia_repository.g.dart';

@Injectable()
class SequenciaRepository extends Disposable {
  final List<SequenciaModel> sequencia = [];
  Future<List<SequenciaModel>> getSequencia(id) async {
    try {
      var response = await http
          .get('http://multidev.com.br/biotrack/api/sequencias/?mtr=$id');
      var decode = json.decode(response.body) as List;
      sequencia.clear();
      decode.forEach((element) {
        sequencia.add(SequenciaModel.fromJson(element));
      });
      print(sequencia.first.estado);
      return sequencia;
    } catch (e) {}
  }

  Future<SequenciaModel> sequenciaM(id) async {
    var response =
        await http.get('http://multidev.com.br/biotrack/api/sequencias/$id/');
    var decode = json.decode(response.body);
    var s = SequenciaModel.fromJson(decode);
    return s;
  }

  Future initialize(id, iniciou) async {
    var response = await http.patch(
      'http://multidev.com.br/biotrack/api/sequencias/$id/',
      body: {'iniciada': '$iniciou'},
    );
    print(response.statusCode);
  }

  Future coletou(id, coletou) async {
    var response = await http.patch(
      'http://multidev.com.br/biotrack/api/sequencias/$id/',
      body: {'coletou': '$coletou'},
    );
    print(response.statusCode);
  }

  Future visitou(id, visitou) async {
    var response = await http.patch(
      'http://multidev.com.br/biotrack/api/sequencias/$id/',
      body: {'visitou': '$visitou'},
    );
    print(response.statusCode);
  }

  Future finalizada(id, finalizada) async {
    var response = await http.patch(
      'http://multidev.com.br/biotrack/api/sequencias/$id/',
      body: {'finalizada': '$finalizada'},
    );
    print(response.statusCode);
  }

  Future fields(id, int sacolas, int sacolasBio, int tambores, int bombonas,
      int bags, int latas, String receptor) async {
    var response =
        await http.patch('http://multidev.com.br/biotrack/api/sequencias/$id/',
            headers: {"Content-type": "application/json"},
            body: json.encode({
              'sacolas': '$sacolas',
              'sacolasBio': '$sacolasBio',
              'tambores': '$tambores',
              'bombonas': '$bombonas',
              'bags': '$bags',
              'latas': '$latas',
              'receptor': '$receptor'
            }));
    print(response.statusCode);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
