import 'package:hive_flutter/hive_flutter.dart';
import 'package:social_app/core/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:social_app/modules/home/data/datasources/get_current_user_datasource.dart';
import 'package:social_app/modules/home/data/dtos/user_dto.dart';

class GetCurrentUserLocalDatasourceImp implements GetCurrentUserDatasource {
  @override
  Future<Either<Exception, UserEntity>> call() async {
    try {
      final json = Hive.box('app').get('user');

      final user = UserDto.fromJson(json);

      return Right(user);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
