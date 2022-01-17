import 'package:dartz/dartz.dart';
import 'package:social_app/modules/auth/domain/entities/signin_entity.dart';
import 'package:social_app/core/entities/user_entity.dart';

abstract class SigninRepository {
  Future<Either<Exception, UserEntity>> call(SigninEntity entity);
}
