import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:social_app/core/others/string_generator.dart';
import 'package:social_app/modules/auth/data/datasources/signup_datasource.dart';
import 'package:social_app/modules/auth/data/repositories/signup_repository_imp.dart';
import 'package:social_app/modules/auth/domain/entities/signup_entity.dart';
import 'package:social_app/core/entities/user_entity.dart';
import 'package:social_app/modules/auth/domain/repositories/signup_repository.dart';
import 'package:social_app/modules/auth/domain/usecases/signup_usecase/signup_usecase.dart';
import 'package:social_app/modules/auth/domain/usecases/signup_usecase/signup_usecase_imp.dart';

class SignupDatasourceMock extends Mock implements SignupDatasource {}

void main() {
  SignupDatasource datasource = SignupDatasourceMock();
  SignupRepository repository = SignupRepositoryImp(datasource);
  SignupUsecase usecase = SignupUsercaseImp(repository);

  test('Should return an valid user', () async {
    final signUp = SignupEntity(
      name: 'Tiago',
      username: 'tihrasguinho',
      email: 'tiago@gmail.com',
      password: '123456',
    );

    final data = UserEntity(
      uid: StringGenerator.generateRandomString(16),
      name: signUp.name,
      username: signUp.username,
      email: signUp.email,
      image: 'image',
      createdAt: DateTime.now().toUtc().millisecondsSinceEpoch,
    );

    when(() => datasource(signUp)).thenAnswer((_) async => Right(data));

    var result = await repository(signUp);

    expect(result, isNotNull);
    expect(result, isA<Right>());
    expect(result.fold((l) => null, (r) => r), isA<UserEntity>());
    expect(result.fold((l) => null, (r) => r)!.uid.length, greaterThanOrEqualTo(16));
  });

  test('Should return an exception', () async {
    final signUp = SignupEntity(
      name: 'Tiago',
      username: 'tihrasguinho',
      email: 'tiagogmail.com',
      password: '123456',
    );

    final data = UserEntity(
      uid: StringGenerator.generateRandomString(16),
      name: signUp.name,
      username: signUp.username,
      email: signUp.email,
      image: 'image',
      createdAt: DateTime.now().toUtc().millisecondsSinceEpoch,
    );

    when(() => datasource(signUp)).thenAnswer((_) async => Right(data));

    var result = await usecase(signUp);

    expect(result, isNotNull);
    expect(result.fold((l) => l, (r) => r), isException);
  });
}
