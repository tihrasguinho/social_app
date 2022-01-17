import 'package:social_app/modules/auth/data/datasources/signin_datasource.dart';
import 'package:social_app/core/entities/user_entity.dart';
import 'package:social_app/modules/auth/domain/entities/signin_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:social_app/modules/auth/domain/repositories/signin_repository.dart';

class SigninRepositoryImp implements SigninRepository {
  final SigninDatasource _signinDatasource;

  SigninRepositoryImp(this._signinDatasource);

  @override
  Future<Either<Exception, UserEntity>> call(SigninEntity entity) async {
    return await _signinDatasource(entity);
  }
}
