import 'dart:convert';

import 'package:social_app/core/entities/user_entity.dart';

extension UserDto on UserEntity {
  Map<String, dynamic> toMap() => {
        'uid': uid,
        'name': name,
        'username': username,
        'email': email,
        'image': image,
        'createdAt': createdAt,
      };

  static UserEntity fromMap(Map map) {
    return UserEntity(
      uid: map['uid'],
      name: map['name'],
      username: map['username'],
      email: map['email'],
      image: map['image'],
      createdAt: map['createdAt'],
    );
  }

  String toJson() => jsonEncode(toMap());

  static UserEntity fromJson(String json) {
    var decoded = jsonDecode(json);

    return fromMap(decoded);
  }
}
