import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:social_app/modules/auth/domain/entities/signup_entity.dart';
import 'package:social_app/modules/auth/domain/usecases/signup_usecase/signup_usecase.dart';
import 'package:social_app/modules/auth/data/dtos/user_dto.dart';

class SignupController {
  final SignupUsecase _signupUsecase;

  SignupController(this._signupUsecase);

  Future<bool> call(
    BuildContext context, {
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    final result = await _signupUsecase(
      SignupEntity(
        name: name,
        username: username,
        email: email,
        password: password,
      ),
    );

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
