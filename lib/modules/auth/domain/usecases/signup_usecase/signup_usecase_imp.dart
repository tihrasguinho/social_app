import 'package:dartz/dartz.dart';
import 'package:social_app/core/entities/user_entity.dart';
import 'package:social_app/modules/auth/domain/entities/signup_entity.dart';
import 'package:social_app/modules/auth/domain/repositories/signup_repository.dart';
import 'package:social_app/modules/auth/domain/usecases/signup_usecase/signup_usecase.dart';

class SignupUsercaseImp implements SignupUsecase {
  final SignupRepository _signupRepository;

  SignupUsercaseImp(this._signupRepository);

  @override
  Future<Either<Exception, UserEntity>> call(SignupEntity entity) async {
    if (!RegExp(r'^[a-z0-9_-]+$').hasMatch(entity.username)) {
      return Left(Exception('Username invalid characters'));
    }

    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(entity.email)) {
      return Left(Exception('Email invalid characters'));
    }

    if (entity.password.length < 6) {
      return Left(Exception('The minimum password length is 6'));
    }

    return await _signupRepository(entity);
  }
}
