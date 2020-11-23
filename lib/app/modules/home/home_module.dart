import 'widgets/widgets_controller.dart';
import 'package:biodriver/app/modules/home/cliente/cliente_page.dart';

import 'cliente/cliente_controller.dart';
import 'package:biodriver/app/modules/home/sequencia/sequencia_page.dart';

import 'sequencia/sequencia_controller.dart';
import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $WidgetsController,
        $ClienteController,
        $SequenciaController,
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage(user: args.data)),
        ModularRouter(
          '/sequencia',
          child: (_, args) => SequenciaPage(
            mtr: args.data,
          ),
        ),
        ModularRouter(
          '/cliente',
          child: (_, args) => ClientePage(
            seq: args.data,
          ),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
