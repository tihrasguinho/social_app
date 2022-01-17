import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_app/modules/home/presentation/controllers/home_controller.dart';
import 'package:social_app/modules/home/presentation/states/current_user_state.dart';
import 'package:social_app/modules/home/presentation/stores/current_user_store.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final controller = Modular.get<HomeController>();
  final currentUserStore = Modular.get<CurrentUserStore>();

  @override
  void initState() {
    controller.getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder<CurrentUserState>(
          valueListenable: currentUserStore,
          builder: (context, state, child) {
            if (state is EmptyCurrentUserState) {
              return const Text('No User Found');
            } else if (state is LoadingCurrentUserState) {
              return const CircularProgressIndicator();
            } else if (state is ErrorCurrentUserState) {
              return Text(state.error);
            } else {
              state as SuccessCurrentUserState;

              return Text(state.user.name);
            }
          },
        ),
      ),
    );
  }
}
