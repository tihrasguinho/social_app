import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_app/modules/auth/data/datasources/firebase/signin_firebase_datasource_imp.dart';
import 'package:social_app/modules/auth/data/datasources/firebase/signup_firebase_datasource_imp.dart';
import 'package:social_app/modules/auth/data/datasources/signin_datasource.dart';
import 'package:social_app/modules/auth/data/datasources/signup_datasource.dart';
import 'package:social_app/modules/auth/data/repositories/signin_repository_imp.dart';
import 'package:social_app/modules/auth/data/repositories/signup_repository_imp.dart';
import 'package:social_app/modules/auth/domain/repositories/signin_repository.dart';
import 'package:social_app/modules/auth/domain/repositories/signup_repository.dart';
import 'package:social_app/modules/auth/domain/usecases/signin_usecase/signin_usecase.dart';
import 'package:social_app/modules/auth/domain/usecases/signin_usecase/signin_usecase_imp.dart';
import 'package:social_app/modules/auth/domain/usecases/signup_usecase/signup_usecase.dart';
import 'package:social_app/modules/auth/domain/usecases/signup_usecase/signup_usecase_imp.dart';
import 'package:social_app/modules/auth/presentation/controllers/signin_controller.dart';
import 'package:social_app/modules/auth/presentation/controllers/signup_controller.dart';
import 'package:social_app/modules/auth/presentation/ui/pages/signin_page.dart';
import 'package:social_app/modules/auth/presentation/ui/pages/signup_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        // Datasources

        Bind.lazySingleton<SignupDatasource>((i) => SignupFirebaseDatasourceImp()),
        Bind.lazySingleton<SigninDatasource>((i) => SigninFirebaseDatasourceImp()),

        // Repositories

        Bind.lazySingleton<SignupRepository>((i) => SignupRepositoryImp(i())),
        Bind.lazySingleton<SigninRepository>((i) => SigninRepositoryImp(i())),

        // Usecases

        Bind.lazySingleton<SignupUsecase>((i) => SignupUsercaseImp(i())),
        Bind.lazySingleton<SigninUsecase>((i) => SigninUsecaseImp(i())),

        // Controllers

        Bind.factory<SignupController>((i) => SignupController(i())),
        Bind.factory<SigninController>((i) => SigninController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const SigninPage(),
          transition: TransitionType.fadeIn,
        ),
        ChildRoute(
          '/signup',
          child: (_, __) => const SignupPage(),
          transition: TransitionType.fadeIn,
        ),
      ];
}
