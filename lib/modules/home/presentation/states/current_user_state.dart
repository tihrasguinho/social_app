import 'package:social_app/core/entities/user_entity.dart';

abstract class CurrentUserState {}

class SuccessCurrentUserState implements CurrentUserState {
  final UserEntity user;

  SuccessCurrentUserState(this.user);
}

class ErrorCurrentUserState implements CurrentUserState {
  final String error;

  ErrorCurrentUserState(this.error);
}

class EmptyCurrentUserState implements CurrentUserState {}

class LoadingCurrentUserState implements CurrentUserState {}
