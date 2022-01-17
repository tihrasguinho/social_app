import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_app/modules/home/presentation/controllers/home_controller.dart';
import 'package:social_app/modules/home/presentation/stores/current_page_store.dart';
import 'package:social_app/modules/home/presentation/ui/widgets/my_bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Modular.get();
  final CurrentPageStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: store,
        builder: (context, index, child) => controller.tabs[index],
      ),
      bottomNavigationBar: MyBottomNav(),
    );
  }
}
