import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
import 'package:fudge/Models/user.dart';

class UserService {
  static Future<List<User>> getUsers() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      String datas = response.body;

      final List<User> userDatas = userFromJson(datas);

      return userDatas;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }
}
