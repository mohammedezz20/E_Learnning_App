
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_learning_app/core/utils/api_constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
        BaseOptions(
      baseUrl: APIConstants.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
    String? token
  }) async {
    dio.options.headers={
      'Content-Type':'application/json',
      'Accept':'application/json',
      'Authorization':'Bearer $token',
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> post({
    required String url,
    String? token,
    Map<String, dynamic>? data,

  }) async {
    dio.options.headers={
      'Content-Type':'application/json',
      'Authorization':'Bearer $token',
    };
    return await dio.post(
      url,data: data,);
  }

  static Future<Response>downloadFile({
    required String networkFilePath,
    required String locationPath,
  })async{
    return await dio.download(networkFilePath, locationPath);
  }

  static Future<Response> put({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    Map<String, dynamic>? data,
  }) async {
    dio.options.headers={
      'Content-Type':'application/json',
      'Accept':'application/json',
      'Authorization':'Bearer $token',
    };
    return await dio.put(
        url,data: data);
  }

  static Future<Response> delete({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    Map<String, dynamic>? data,

  }) async {
    dio.options.headers={
      'Content-Type':'application/json',
      'Accept':'application/json',
      'Authorization':'Bearer $token',
    };

    return await dio.delete(
        url, queryParameters: query, data: data);
  }

static Future<Response> uploadFile({
  required String url,
  Map<String, dynamic>? query,
  Map<String, dynamic>? data,
  required String token,
  required File file,  
}) async {
  FormData formData = FormData();
  dio.options.headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
    String fileName = file.path.split('/').last;
    formData.files.add(MapEntry(
      'file',
      await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    ));
  return await dio.post(
    url,
    queryParameters: query,
    data: formData,
  );
}

}

