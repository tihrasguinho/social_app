import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:social_app/core/others/string_generator.dart';
import 'package:social_app/modules/auth/domain/entities/signup_entity.dart';
import 'package:social_app/core/entities/user_entity.dart';
import 'package:social_app/modules/auth/domain/repositories/signup_repository.dart';
import 'package:social_app/modules/auth/domain/usecases/signup_usecase/signup_usecase.dart';
import 'package:social_app/modules/auth/domain/usecases/signup_usecase/signup_usecase_imp.dart';

class SignupRepositoryMock extends Mock implements SignupRepository {}

void main() {
  SignupRepository repository = SignupRepositoryMock();
  SignupUsecase usecase = SignupUsercaseImp(repository);

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

  test('Should return an UserEntity', () async {
    when(() => repository(signUp)).thenAnswer((_) async => Right(data));

    var result = await usecase(signUp);

    expect(result, isNotNull);
    expect(result.fold((l) => l, (r) => r), isA<UserEntity>());
    verify(() => repository(signUp));
  });

  test('Should return an Exception', () async {
    when(() => repository(signUp)).thenAnswer((_) async => Left(Exception('Fail to create an user')));

    var result = await usecase(signUp);

    expect(result, isNotNull);
    expect(result.fold((l) => l, (r) => r), isException);
    verify(() => repository(signUp));
  });
}
