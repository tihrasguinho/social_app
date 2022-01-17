import 'package:flutter/material.dart';
import 'package:social_app/core/entities/user_entity.dart';
import 'package:social_app/modules/home/presentation/states/current_user_state.dart';

class CurrentUserStore extends ValueNotifier<CurrentUserState> {
  CurrentUserStore() : super(EmptyCurrentUserState());

  void setCurrentUser(UserEntity user) {
    value = SuccessCurrentUserState(user);
  }

  void removeCurrentUser() {
    value = EmptyCurrentUserState();
  }
}
