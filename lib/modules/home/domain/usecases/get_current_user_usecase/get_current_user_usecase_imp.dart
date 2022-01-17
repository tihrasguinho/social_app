import 'package:social_app/core/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:social_app/modules/home/domain/repositories/get_current_user_repository.dart';
import 'package:social_app/modules/home/domain/usecases/get_current_user_usecase/get_current_user_usecase.dart';

class GetCurrentUserUsecaseImp implements GetCurrentUserUsecase {
  final GetCurrentUserRepository _getCurrentUserRepository;

  GetCurrentUserUsecaseImp(this._getCurrentUserRepository);

  @override
  Future<Either<Exception, UserEntity>> call() async {
    return await _getCurrentUserRepository();
  }
}
