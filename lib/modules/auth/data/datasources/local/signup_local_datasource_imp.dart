import 'package:dartz/dartz.dart';
import 'package:social_app/core/others/string_generator.dart';
import 'package:social_app/modules/auth/data/datasources/signup_datasource.dart';
import 'package:social_app/core/entities/user_entity.dart';
import 'package:social_app/modules/auth/domain/entities/signup_entity.dart';

class SignupLocalDatasourceImp implements SignupDatasource {
  @override
  Future<Either<Exception, UserEntity>> call(SignupEntity entity) async {
    try {
      var user = UserEntity(
        uid: StringGenerator.generateRandomString(16),
        name: entity.name,
        username: entity.username,
        email: entity.email,
        image: '',
        createdAt: DateTime.now().toUtc().millisecondsSinceEpoch,
      );

      return Right(user);
    } on Exception catch (e) {
      return Left(Exception(e));
    }
  }
}
