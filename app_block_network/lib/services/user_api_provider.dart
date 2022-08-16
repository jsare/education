import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserProvider {
  //https://jsonplaceholder.typicode.com/users
  Future<List<User>> getUser() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}
