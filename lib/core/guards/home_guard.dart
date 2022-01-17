import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeGuard extends RouteGuard {
  HomeGuard() : super(redirectTo: '/');

  @override
  FutureOr<bool> canActivate(String path, ModularRoute route) {
    return Hive.box('app').get('signedIn');
  }
}
