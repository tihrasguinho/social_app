import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:social_app/modules/auth/domain/entities/signin_entity.dart';
import 'package:social_app/modules/auth/domain/usecases/signin_usecase/signin_usecase.dart';

import 'package:social_app/modules/auth/data/dtos/user_dto.dart';

class SigninController {
  final SigninUsecase _signinUsecase;

  SigninController(this._signinUsecase);

  Future<bool> call(BuildContext context, {required String email, required String password}) async {
    final result = await _signinUsecase(SigninEntity(email: email, password: password));

    if (result.isRight()) {
      final user = result.fold((l) => null, (r) => r);

      await Hive.box('app').put('user', user!.toJson());

      await Hive.box('app').put('signedIn', true);

      return true;
    } else {
      final exception = result.fold((l) => l, (r) => null);

      log(exception.toString());

      var message = exception.toString().replaceAll('Exception: ', '');

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );

      return false;
    }
  }
}
