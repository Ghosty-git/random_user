import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:random_user/features/users/data/models/user_model.dart';
import 'package:random_user/features/users/domain/repositories/user_repository.dart';
import 'package:random_user/internal/helpers/api_requester.dart';
import 'package:random_user/internal/helpers/catch_exceptions_helper.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserModel> getRandomUser() async {
    ApiRequester apiRequester = ApiRequester();

    try {
      Response response = await apiRequester.toGet("");
      log("user response === ${response.data}");

      // if (response.statusCode == 200) {
      //   return response.data
      //       .map<UserModel>((val) => UserModel.fromJson(val))
      //       .toList();
      // }

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }

      throw CatchException.convertException(response);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
