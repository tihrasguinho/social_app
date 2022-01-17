import 'dart:developer';

import 'package:social_app/modules/home/domain/usecases/get_current_user_usecase/get_current_user_usecase.dart';
import 'package:social_app/modules/home/presentation/stores/current_user_store.dart';
import 'package:social_app/modules/home/presentation/ui/tabs/favorites_tab.dart';
import 'package:social_app/modules/home/presentation/ui/tabs/home_tab.dart';
import 'package:social_app/modules/home/presentation/ui/tabs/profile_tab.dart';
import 'package:social_app/modules/home/presentation/ui/tabs/search_tab.dart';

class HomeController {
  final GetCurrentUserUsecase _getCurrentUserUsecase;
  final CurrentUserStore _currentUserStore;

  HomeController(this._getCurrentUserUsecase, this._currentUserStore);

  final tabs = [
    const HomeTab(),
    const SearchTab(),
    const FavoritesTab(),
    const ProfileTab(),
  ];

  Future getCurrentUser() async {
    final result = await _getCurrentUserUsecase();

    if (result.isRight()) {
      final user = result.fold((l) => null, (r) => r);

      _currentUserStore.setCurrentUser(user!);
    } else {
      final exception = result.fold((l) => l, (r) => null);

      log(exception.toString());
    }
  }
}
