import 'package:rest_api_practice/model/name.dart';
import 'package:rest_api_practice/model/picture.dart';
import 'package:rest_api_practice/model/user_model.dart';
import 'package:rest_api_practice/services/ApiService.dart';

class UserViewModel{
  final ApiService _apiService = ApiService();
  Future<List<User>> callApi() async{
    final data = await _apiService.fetchData();
    final transformed = data.map((user){
      final name = Name(
          title: user["name"]["title"],
          firstName: user["name"]["first"],
          lastName: user["name"]["last"]);
      final pic = ProfilePicture(
          large: user["picture"]["large"],
          medium: user["picture"]["medium"],
          thumbnail: user["picture"]["thumbnail"]);
      return User(
          gender: user["gender"],
          email: user["email"],
          phone: user["phone"],
          nat: user["nat"],
          name: name,
          picture: pic
      );
    }).toList();
    return transformed;
  }
}