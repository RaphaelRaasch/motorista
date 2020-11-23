import 'package:biodriver/app/modules/model/motorista_model.dart';
import 'package:biodriver/app/modules/model/mtr-model.dart';
import 'package:biodriver/app/modules/repository/motorista_repository.dart';
import 'package:biodriver/app/modules/repository/mtr_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  MotoristaModel motorista;
  @observable
  List<MtrModel> listMtr = [];
  @action
  Future getMotorista(id) async {
    var response = await MotoristaRepository().getMotorista(id);
    motorista = response;
  }

  @action
  Future getMtr() async {
    var response = await MtrRepository().listMtr(motorista.idMultidev);
    listMtr = response;
  }
}
