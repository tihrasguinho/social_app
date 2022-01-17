import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:social_app/core/others/string_generator.dart';
import 'package:social_app/modules/auth/data/datasources/signin_datasource.dart';
import 'package:social_app/modules/auth/data/repositories/signin_repository_imp.dart';
import 'package:social_app/modules/auth/domain/entities/signin_entity.dart';
import 'package:social_app/core/entities/user_entity.dart';
import 'package:social_app/modules/auth/domain/repositories/signin_repository.dart';
import 'package:social_app/modules/auth/domain/usecases/signin_usecase/signin_usecase.dart';
import 'package:social_app/modules/auth/domain/usecases/signin_usecase/signin_usecase_imp.dart';

class SigninDatasourceMock extends Mock implements SigninDatasource {}

void main() {
  SigninDatasource datasource = SigninDatasourceMock();
  SigninRepository repository = SigninRepositoryImp(datasource);
  SigninUsecase usecase = SigninUsecaseImp(repository);

  test('Should return an valid user', () async {
    final signIn = SigninEntity(
      email: 'tiago@gmail.com',
      password: '123456',
    );

    final data = UserEntity(
      uid: StringGenerator.generateRandomString(16),
      name: StringGenerator.generateRandomString(5),
      username: StringGenerator.generateRandomString(8),
      email: signIn.email,
      image: 'image',
      createdAt: DateTime.now().toUtc().millisecondsSinceEpoch,
    );

    when(() => datasource(signIn)).thenAnswer((_) async => Right(data));

    var result = await usecase(signIn);

    expect(result, isNotNull);
    expect(result.isRight(), equals(true));
    expect(result.fold((l) => null, (r) => r), isA<UserEntity>());
  });

  test('Should return an exception', () async {
    final signIn = SigninEntity(
      email: 'tiagogmail.com',
      password: '123456',
    );

    final data = UserEntity(
      uid: StringGenerator.generateRandomString(16),
      name: StringGenerator.generateRandomString(5),
      username: StringGenerator.generateRandomString(8),
      email: signIn.email,
      image: 'image',
      createdAt: DateTime.now().toUtc().millisecondsSinceEpoch,
    );

    when(() => datasource(signIn)).thenAnswer((_) async => Right(data));

    var result = await usecase(signIn);

    expect(result, isNotNull);
    expect(result.isLeft(), equals(true));
    expect(result.fold((l) => l, (r) => null), isException);
  });
}
