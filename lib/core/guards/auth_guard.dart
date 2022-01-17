import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/home/');

  @override
  FutureOr<bool> canActivate(String path, ModularRoute route) {
    return !Hive.box('app').get('signedIn');
  }
}
