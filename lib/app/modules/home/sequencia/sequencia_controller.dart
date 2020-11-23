import 'package:biodriver/app/modules/model/sequencia_model.dart';
import 'package:biodriver/app/modules/repository/sequencia_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'sequencia_controller.g.dart';

@Injectable()
class SequenciaController = _SequenciaControllerBase with _$SequenciaController;

abstract class _SequenciaControllerBase with Store {
  @observable
  List<SequenciaModel> listSequencia = [];

  @action
  Future getSequencia(id) async {
    var response = await SequenciaRepository().getSequencia(id);
    listSequencia = response;
  }
}
