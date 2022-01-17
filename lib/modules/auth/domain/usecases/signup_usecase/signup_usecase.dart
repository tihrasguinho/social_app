import 'package:dartz/dartz.dart';
import 'package:social_app/modules/auth/domain/entities/signup_entity.dart';
import 'package:social_app/core/entities/user_entity.dart';

abstract class SignupUsecase {
  Future<Either<Exception, UserEntity>> call(SignupEntity entity);
}
