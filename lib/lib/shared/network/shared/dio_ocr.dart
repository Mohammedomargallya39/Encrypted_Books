import 'package:dio/dio.dart';
class DioOcr {
  static Dio? dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://bookocr.ddns.net:8000/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: 10000,
        receiveTimeout: 10000,
      ),
    );
  }

  static Future<Response?> postOCR({
    required String url,
    dynamic data,
  })async {
    try{
      return await dio?.post(
        url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
    }on DioError catch(error){
      print(error.toString());
    }
    return null;
  }
}

