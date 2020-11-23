import 'dart:convert';

import 'package:biodriver/app/modules/model/mtr-model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:http/http.dart' as http;

part 'mtr_repository.g.dart';

@Injectable()
class MtrRepository extends Disposable {
  List<MtrModel> list = [];
  Future<List<MtrModel>> listMtr(id) async {
    try {
      var response = await http
          .get('http://multidev.com.br/biotrack/api/mtrs/?motorista=$id');
      if (response.statusCode == 200) {
        var decode = json.decode(response.body) as List;
        list.clear();
        decode.forEach((element) {
          list.add(MtrModel.fromJson(element));
        });
        print(list.first.alias);
        return list;
      }
    } catch (e) {
      print(e);
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
