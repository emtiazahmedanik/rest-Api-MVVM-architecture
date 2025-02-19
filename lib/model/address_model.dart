import 'package:rest_api_practice/model/street_model.dart';

class AddressModel{
  final String city;
  final String state;
  final String country;
  final String postcode;
  final StreetModel streetModel;

  AddressModel({
    required this.city,
    required this.country,
    required this.postcode,
    required this.state,
    required this.streetModel
});


}