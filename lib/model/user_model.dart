import 'dart:ui';

import 'package:rest_api_practice/model/picture.dart';

import 'name.dart';

class User{
  final String gender;
  final String email;
  final String phone;
  final String nat;
  final Name name;
  final ProfilePicture picture;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.nat,
    required this.name,
    required this.picture
});



}