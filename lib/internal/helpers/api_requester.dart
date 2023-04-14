import 'package:dio/dio.dart';
import 'package:random_user/internal/helpers/catch_exceptions_helper.dart';

class ApiRequester {
  String url = "https://randomuser.me/api/";

  Future<Dio> initDio() async {
    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  Future<Response> toGet(String url, {Map<String, dynamic>? param })async{
    Dio dio = await initDio();

    try {
    return  dio.get(url, queryParameters: param);
    } catch (e) {
      print("get error ==== $e");

      throw CatchException.convertException(e);
    }


  }

  Future<Response> toPost(String url, {Map<String, dynamic>? param })async{
    Dio dio = await initDio();

    try {
    return  dio.post(url, queryParameters: param);
    } catch (e) {
      print("get error ==== $e");

      throw CatchException.convertException(e);
    }
  }
}
