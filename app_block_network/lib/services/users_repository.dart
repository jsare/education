import '../models/user.dart';
import 'user_api_provider.dart';

class UsersRepository {
  // Создаём переменную, которая будет обращатсья к нашему классу UserProvider
  final UserProvider _usersProvider = UserProvider();
  // Через перменную userProvider обращаемся к Api, через метод .getUser()
  Future<List<User>> getAllUsers() => _usersProvider.getUser();
}
