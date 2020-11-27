import 'package:biodriver/app/modules/repository/user_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'splash_controller.g.dart';

@Injectable()
class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  @action
  Future login(email, password) async {
    var response = await UserRepository().auth(email, password);
  }
}
