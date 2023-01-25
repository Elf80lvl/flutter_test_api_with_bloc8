import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class Network {
  String url = 'https://jsonplaceholder.typicode.com/users';
  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final list = userFromJson(response.body);

      return list;
    } else {
      throw Exception('error fetching users');
    }
  }
}
