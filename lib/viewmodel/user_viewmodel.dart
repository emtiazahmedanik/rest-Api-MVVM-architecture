import 'package:rest_api_practice/model/user_model.dart';
import 'package:rest_api_practice/services/ApiService.dart';

class UserViewModel{
  final ApiService _apiService = ApiService();
  Future<List<User>> callApi() async{
    final data = await _apiService.fetchData();
    final transformed = data.map((user){
      return User(
          gender: user["gender"],
          email: user["email"],
          phone: user["phone"],
          nat: user["nat"]
      );
    }).toList();
    return transformed;
  }
}