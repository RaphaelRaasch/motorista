import 'package:biodriver/app/modules/repository/user_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool passwordVisible = false;

  @observable
  bool loading = false;

  @computed
  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;

  @action
  Future login() async {
    if (isFormValid == true) {
      loading = true;
      var response = UserRepository().auth(email, password);
      print(response);
      loading = false;
    } else {
      return 'Campo obrigatorio';
    }
  }
}
