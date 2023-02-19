import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverapi/models/user_model.dart';

class ApiService {
  Future<List<UserModel>> getUsers(int q) async {
    String query = q.toString();
  String endpoint = 'https://reqres.in/api/users?page=$query';
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      print(result);
      return result.map(((e) => UserModel.fromjson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final userProvider = Provider<ApiService>((ref) => ApiService());
