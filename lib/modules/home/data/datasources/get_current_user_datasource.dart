import 'package:dartz/dartz.dart';
import 'package:social_app/core/entities/user_entity.dart';

abstract class GetCurrentUserDatasource {
  Future<Either<Exception, UserEntity>> call();
}
