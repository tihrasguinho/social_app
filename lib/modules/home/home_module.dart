import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_app/modules/home/data/datasources/get_current_user_datasource.dart';
import 'package:social_app/modules/home/data/datasources/local/get_current_user_local_datasource_imp.dart';
import 'package:social_app/modules/home/data/repositories/get_current_user_repository_imp.dart';
import 'package:social_app/modules/home/domain/repositories/get_current_user_repository.dart';
import 'package:social_app/modules/home/domain/usecases/get_current_user_usecase/get_current_user_usecase.dart';
import 'package:social_app/modules/home/domain/usecases/get_current_user_usecase/get_current_user_usecase_imp.dart';
import 'package:social_app/modules/home/presentation/controllers/home_controller.dart';
import 'package:social_app/modules/home/presentation/stores/current_page_store.dart';
import 'package:social_app/modules/home/presentation/stores/current_user_store.dart';
import 'package:social_app/modules/home/presentation/ui/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        // Datasources

        Bind.lazySingleton<GetCurrentUserDatasource>((i) => GetCurrentUserLocalDatasourceImp()),

        // Repositories

        Bind.lazySingleton<GetCurrentUserRepository>((i) => GetCurrentUserRepositoryImp(i())),

        // Usecases

        Bind.lazySingleton<GetCurrentUserUsecase>((i) => GetCurrentUserUsecaseImp(i())),

        // Stores

        Bind.lazySingleton<CurrentPageStore>((i) => CurrentPageStore()),
        Bind.lazySingleton<CurrentUserStore>((i) => CurrentUserStore()),

        // Controllers

        Bind.factory<HomeController>((i) => HomeController(i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage(), transition: TransitionType.fadeIn),
      ];
}
