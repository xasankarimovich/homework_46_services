

import '../models/users/user_model.dart';
import '../services/users_http_services.dart';

class CategorysController {
  UsersHttpService usersHttpService = UsersHttpService();

  Future<List<UserModel>> getUsers() async {
    List<UserModel> users = await usersHttpService.getUsers();
    return users;
  }
}