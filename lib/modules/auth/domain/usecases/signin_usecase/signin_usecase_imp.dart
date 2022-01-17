import 'package:social_app/core/entities/user_entity.dart';
import 'package:social_app/modules/auth/domain/entities/signin_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:social_app/modules/auth/domain/repositories/signin_repository.dart';
import 'package:social_app/modules/auth/domain/usecases/signin_usecase/signin_usecase.dart';

class SigninUsecaseImp implements SigninUsecase {
  final SigninRepository _signinRepository;

  SigninUsecaseImp(this._signinRepository);

  @override
  Future<Either<Exception, UserEntity>> call(SigninEntity entity) async {
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(entity.email)) {
      return Left(Exception('Email invalid characters'));
    }

    return await _signinRepository(entity);
  }
}
