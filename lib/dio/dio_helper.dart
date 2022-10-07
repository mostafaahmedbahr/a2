import 'package:dio/dio.dart';
 class DioAdanHelper
{
  static Dio? dio;

  static int() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://laravel.ptoolz.com/api/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    String? url,
    Map<String,dynamic>? query,
  }) async
  {
    return await dio!.get(url!,
      queryParameters: query,
    );
  }

}