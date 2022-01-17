import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_app/core/guards/auth_guard.dart';
import 'package:social_app/core/guards/home_guard.dart';
import 'package:social_app/core/presentation/ui/pages/splash_page.dart';
import 'package:social_app/modules/auth/auth_module.dart';
import 'package:social_app/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const SplashPage()),
        ModuleRoute('/auth', module: AuthModule(), guards: [AuthGuard()]),
        ModuleRoute('/home', module: HomeModule(), guards: [HomeGuard()]),
      ];
}
