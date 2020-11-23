import 'modules/repository/gestor_repository.dart';
import 'modules/repository/cliente_repository.dart';
import 'modules/repository/sequencia_repository.dart';
import 'modules/repository/motorista_repository.dart';
import 'modules/repository/mtr_repository.dart';
import 'package:dio/dio.dart';
import 'modules/repository/user_repository.dart';
import 'package:biodriver/app/modules/auth/auth_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:biodriver/app/app_widget.dart';
import 'package:biodriver/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $GestorRepository,
        $ClienteRepository,
        $SequenciaRepository,
        $MotoristaRepository,
        $MtrRepository,
        $UserRepository,
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: AuthModule()),
        ModularRouter('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
