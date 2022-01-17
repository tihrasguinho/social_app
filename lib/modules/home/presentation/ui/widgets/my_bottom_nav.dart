import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_app/modules/home/presentation/stores/current_page_store.dart';

class MyBottomNav extends StatelessWidget {
  MyBottomNav({Key? key}) : super(key: key);

  final currentPage = Modular.get<CurrentPageStore>();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 5,
      color: Colors.white,
      child: SizedBox(
        height: kToolbarHeight,
        child: ValueListenableBuilder<int>(
          valueListenable: currentPage,
          builder: (context, value, child) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => currentPage.setPage(0),
                icon: value == 0
                    ? Icon(
                        Icons.home_rounded,
                        color: value == 0 ? Theme.of(context).primaryColor : Colors.grey,
                      )
                    : Icon(
                        Icons.home_outlined,
                        color: value == 0 ? Theme.of(context).primaryColor : Colors.grey,
                      ),
              ),
              IconButton(
                onPressed: () => currentPage.setPage(1),
                icon: value == 1
                    ? Icon(
                        Icons.search_rounded,
                        color: value == 1 ? Theme.of(context).primaryColor : Colors.grey,
                      )
                    : Icon(
                        Icons.search_outlined,
                        color: value == 1 ? Theme.of(context).primaryColor : Colors.grey,
                      ),
              ),
              IconButton(
                onPressed: () => currentPage.setPage(2),
                icon: value == 2
                    ? Icon(
                        Icons.favorite_rounded,
                        color: value == 2 ? Theme.of(context).primaryColor : Colors.grey,
                      )
                    : Icon(
                        Icons.favorite_outline,
                        color: value == 2 ? Theme.of(context).primaryColor : Colors.grey,
                      ),
              ),
              IconButton(
                onPressed: () => currentPage.setPage(3),
                icon: value == 3
                    ? Icon(
                        Icons.person_rounded,
                        color: value == 3 ? Theme.of(context).primaryColor : Colors.grey,
                      )
                    : Icon(
                        Icons.person_outline,
                        color: value == 3 ? Theme.of(context).primaryColor : Colors.grey,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
