import 'package:injectable/injectable.dart';
import 'package:random_user/features/users/data/models/user_model.dart';
import 'package:random_user/features/users/domain/repositories/user_repository.dart';

@injectable
class UseUserCase{
  final UserRepository userRepository;

  UseUserCase({required this.userRepository});

  Future<UserModel> getRandomUser() async => await userRepository.getRandomUser();
  
}