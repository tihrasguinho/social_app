import 'package:social_app/core/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:social_app/modules/home/data/datasources/get_current_user_datasource.dart';
import 'package:social_app/modules/home/domain/repositories/get_current_user_repository.dart';

class GetCurrentUserRepositoryImp implements GetCurrentUserRepository {
  final GetCurrentUserDatasource _getCurrentUserDatasource;

  GetCurrentUserRepositoryImp(this._getCurrentUserDatasource);

  @override
  Future<Either<Exception, UserEntity>> call() async {
    return await _getCurrentUserDatasource();
  }
}
