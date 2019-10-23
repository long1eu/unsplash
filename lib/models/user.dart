// File created by
// Lung Razvan <long1eu>
// on 16/09/2019

library user;

import 'package:built_value/built_value.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  factory User([void updates(UserBuilder b)]) = _$User;

  factory User.initialState() {
    return _$User((UserBuilder b) => b..age = 0);
  }

  User._();

  int get age;
}
