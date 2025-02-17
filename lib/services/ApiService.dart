import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiService{
  static String baseUrl = "https://randomuser.me/api/?results=50";
  static Uri uri = Uri.parse(baseUrl);
  Future<List<dynamic>> fetchData() async{
    final response = await http.get(uri);
    final json = jsonDecode(response.body) ;
    final result = json["results"] as List<dynamic>;
    if(response.statusCode == 200){
      return result;
    }
    else{
      throw Exception('Failed to load data');
    }
  }
}