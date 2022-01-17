import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/modules/auth/data/datasources/signup_datasource.dart';
import 'package:social_app/modules/auth/data/dtos/user_dto.dart';
import 'package:social_app/core/entities/user_entity.dart';
import 'package:social_app/modules/auth/domain/entities/signup_entity.dart';

class SignupFirebaseDatasourceImp implements SignupDatasource {
  @override
  Future<Either<Exception, UserEntity>> call(SignupEntity entity) async {
    try {
      final auth = FirebaseAuth.instance;
      final firestore = FirebaseFirestore.instance;

      final result = await auth.createUserWithEmailAndPassword(email: entity.email, password: entity.password);

      final user = UserDto.fromMap({
        'uid': result.user!.uid,
        'name': entity.name,
        'username': entity.username,
        'email': entity.email,
        'image': '',
        'createdAt': DateTime.now().toUtc().millisecondsSinceEpoch,
      });

      await firestore.collection('users').doc(user.uid).set(user.toMap()..remove('uid'));

      return Right(user);
    } on Exception catch (e) {
      if (e is FirebaseException) {
        return Left(Exception(e.code));
      }

      return Left(e);
    }
  }
}
