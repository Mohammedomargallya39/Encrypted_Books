import 'package:dio/dio.dart';
class DioOcr {
  static late Dio dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://bookocr.ddns.net:8000/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: 1000000,
        receiveTimeout: 1000000,
      ),
    );
  }

  static Future<Response?> postOCR({
    required String url,
    dynamic data,
  })async {
    try{
      return await dio.post(
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

