import 'package:social_app/modules/auth/data/datasources/signup_datasource.dart';
import 'package:social_app/core/entities/user_entity.dart';
import 'package:social_app/modules/auth/domain/entities/signup_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:social_app/modules/auth/domain/repositories/signup_repository.dart';

class SignupRepositoryImp implements SignupRepository {
  final SignupDatasource _signupDatasource;

  SignupRepositoryImp(this._signupDatasource);

  @override
  Future<Either<Exception, UserEntity>> call(SignupEntity entity) async {
    return await _signupDatasource(entity);
  }
}
