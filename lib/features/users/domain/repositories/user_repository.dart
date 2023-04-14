import 'package:random_user/features/users/data/models/user_model.dart';

abstract class UserRepository{
 Future<UserModel> getRandomUser();
}

 