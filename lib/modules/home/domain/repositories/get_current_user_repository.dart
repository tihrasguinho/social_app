import 'package:dartz/dartz.dart';
import 'package:social_app/core/entities/user_entity.dart';

abstract class GetCurrentUserRepository {
  Future<Either<Exception, UserEntity>> call();
}
