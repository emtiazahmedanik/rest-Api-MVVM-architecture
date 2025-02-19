import 'dart:ui';

import 'package:rest_api_practice/model/address_model.dart';
import 'package:rest_api_practice/model/picture.dart';

import 'name.dart';

class User{
  final String gender;
  final String email;
  final String phone;
  final String nat;
  final Name name;
  final ProfilePicture picture;
  final AddressModel address;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.nat,
    required this.name,
    required this.picture,
    required this.address
});



}