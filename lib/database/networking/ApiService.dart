import 'dart:io';

import 'package:dio/dio.dart';

enum DioMethod { postLogin, post, get, put, delete }

class ApiService {
  ApiService._singleton();
  static final ApiService instance = ApiService._singleton();

  String baseUrl = "http://192.168.1.14/BerbagiCatatan/api/";

  Future<Response> request(String endpoint, DioMethod method,
      {Map<String, dynamic>? param, String? contentType, formData}) async {
    try {
      final dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          contentType: contentType ?? Headers.formUrlEncodedContentType,
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 3)));

      switch (method) {
        case DioMethod.postLogin:
          return dio.post(endpoint, queryParameters: param);
        case DioMethod.post:
          return dio.post(endpoint, data: param ?? formData);
        case DioMethod.get:
          return dio.get(endpoint, queryParameters: param);
        case DioMethod.put:
          return dio.put(endpoint, data: param ?? formData);
        case DioMethod.delete:
          return dio.delete(endpoint, data: param ?? formData);
        default:
          return dio.post(endpoint, data: param ?? formData);
      }
    } catch (e) {
      throw Exception('Network Error');
    }
  }
}
