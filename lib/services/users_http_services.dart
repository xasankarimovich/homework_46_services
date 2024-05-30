import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/users/user_model.dart';

class UsersHttpService {
  Future<List<UserModel>> getUsers() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/users");
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final body = response.body;
        final List<dynamic> jsonData = jsonDecode(body);

        List<UserModel> loadedUsers = jsonData
            .map((item) => UserModel.fromJson(item as Map<String, dynamic>))
            .toList();

        return loadedUsers;
      } else {
        throw Exception("Failed to load users: ${response.statusCode}");
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load users: $e');
    }
  }
}
