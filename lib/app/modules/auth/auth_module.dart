import 'package:biodriver/app/modules/auth/splash/splash_page.dart';

import 'splash/splash_controller.dart';
import 'auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'auth_page.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $SplashController,
        $AuthController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => SplashPage()),
        ModularRouter('/auth', child: (_, args) => AuthPage()),
      ];

  static Inject get to => Inject<AuthModule>.of();
}
