import 'package:dio/dio.dart';
import 'package:social/lib/shared/components/components.dart';

class DioHelper{
  static late Dio dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://lib-hti.herokuapp.com/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: 10000,
        receiveTimeout: 10000,
      ),
    );
  }
//post
  static Future<Response> postData({
    dynamic data,
    Map<String, dynamic>? query,
    required String url,
    String lang = 'en',
    String? token,
  }) async {
    return dio.post(
      url,
      data: data,
      queryParameters: query,
      options: Options(
        headers: {
          'lang': lang,
          'Content-Type': 'application/json',
          'Authorization': token ?? '',
        },
      ),
    ).catchError((error)
    {
      print(error.toString());
      // var message =  error.response.data.toString();
      // showToast(message: message, state: ToastStates.ERROR);
    });
  }
  //postDataWithToken
  static Future<Response?> postDataWithToken({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
    String? token,
  }) async {
    try{
      return await dio.post(
        url,
        data: data,
        queryParameters: query??null,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization' : 'Bearer ${token??''}',
          },
        ),
      );
    }on DioError catch(error){
      // var message =  e.response!.data.toString();
      // showToast(message: message, state: ToastStates.ERROR);
      print(error.toString());

    }
  }
  // //postBook
  // static Future<Response?> postBook({
  //   required String url,
  //   Map<String, dynamic>? query,
  //   dynamic data,
  //   String? token,
  // }) async {
  //   try{
  //     return await dio.post(
  //       url,
  //       data: data,
  //       queryParameters: query??null,
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'multipart/form-data; boundary=<calculated when request is sent>',
  //           'Authorization' : 'Bearer ${token??''}',
  //         },
  //       ),
  //     );
  //   }on DioError catch(error){
  //     // var message =  e.response!.data.toString();
  //     // showToast(message: message, state: ToastStates.ERROR);
  //     print(error.toString());
  //
  //   }
  // }
  //get
  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  })async
  {
    try{
      return await dio.get(
        url,
        queryParameters: query??null,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization' : 'Bearer ${token??''}',
          },
        ),
      );
    }on DioError catch(error){
      // var message =  e.response!.data.toString();
      // showToast(message: message, state: ToastStates.ERROR);
      print(error.toString());

    }
  }
  //put
  static Future<Response?> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  })async
  {
    try{
      return await dio.put(
        url,
        data: data,
        queryParameters: query,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization' : 'Bearer ${token??''}'
          },
        ),
      );
    }on DioError catch(error){
      // var message =  e.response!.data['message'].toString();
      // showToast(message: message, state: ToastStates.ERROR);
      print(error.toString());

    }
  }
  //patch
  static Future<Response?> patchData({
    required String url,
    dynamic data,
    String? token,
  })async
  {
    try{
      return await dio.patch(
        url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization' : 'Bearer ${token??''}'
          },
        ),
      );
    }on DioError catch(error){
      // var message =  e.response!.data['message'].toString();
      // showToast(message: message, state: ToastStates.ERROR);
      print(error.toString());

    }
  }
 //delete
  static Future<Response?> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  })async
  {
    try{
      return await dio.delete(
        url,
        data: data,
        queryParameters: query,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization' : 'Bearer ${token??''}'
          },
        ),
      );
    }on DioError catch(error){
      // var message =  e.response!.data['message'].toString();
      // showToast(message: message, state: ToastStates.ERROR);
      print(error.toString());

    }
  }
}