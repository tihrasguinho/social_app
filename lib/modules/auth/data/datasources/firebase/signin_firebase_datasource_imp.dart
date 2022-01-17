import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/modules/auth/data/datasources/signin_datasource.dart';
import 'package:social_app/modules/auth/data/dtos/user_dto.dart';
import 'package:social_app/core/entities/user_entity.dart';
import 'package:social_app/modules/auth/domain/entities/signin_entity.dart';

class SigninFirebaseDatasourceImp implements SigninDatasource {
  @override
  Future<Either<Exception, UserEntity>> call(SigninEntity entity) async {
    try {
      final auth = FirebaseAuth.instance;
      final firestore = FirebaseFirestore.instance;

      final result = await auth.signInWithEmailAndPassword(email: entity.email, password: entity.password);

      final data = await firestore.collection('users').doc(result.user!.uid).get();

      if (!data.exists) return Left(Exception('User do not have data!'));

      final user = UserDto.fromFirebase(data);

      return Right(user);
    } on Exception catch (e) {
      if (e is FirebaseException) {
        return Left(Exception(e.code));
      }

      return Left(e);
    }
  }
}
