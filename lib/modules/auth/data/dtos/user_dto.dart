import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_app/core/entities/user_entity.dart';

extension UserDto on UserEntity {
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

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'name': name,
        'username': username,
        'email': email,
        'image': image,
        'createdAt': createdAt,
      };

  static UserEntity fromJson(String json) => UserDto.fromMap(jsonDecode(json));

  String toJson() => jsonEncode(toMap());

  static UserEntity fromFirebase(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return UserEntity(
      uid: doc.id,
      name: data['name'],
      username: data['username'],
      email: data['email'],
      image: data['image'],
      createdAt: data['createdAt'],
    );
  }
}
