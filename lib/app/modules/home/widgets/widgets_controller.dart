import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'widgets_controller.g.dart';

@Injectable()
class WidgetsController = _WidgetsControllerBase with _$WidgetsController;

abstract class _WidgetsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
