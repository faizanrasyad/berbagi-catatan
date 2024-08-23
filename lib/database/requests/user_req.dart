import 'dart:io';
import 'dart:math';

import 'package:berbagi_catatan/data/login_data.dart';
import 'package:berbagi_catatan/database/model_database.dart/user_model_database.dart';
import 'package:berbagi_catatan/model/user_model.dart';
import 'package:berbagi_catatan/database/networking/ApiService.dart';
import 'package:flutter/material.dart';

class UserReq {
  UserDatabase? user;

  Future<void> requestLogin(
    String username,
    String password,
  ) async {
    try {
      final response = await ApiService.instance.request(
          'login', DioMethod.postLogin,
          param: {'username': username, 'password': password},
          contentType: 'application/json');

      if (response.statusCode == 200) {
        var responseBody = response.data;

        user = UserDatabase(
            id: responseBody['id'],
            name: responseBody['name'],
            username: responseBody['username'],
            password: responseBody['password']);
        LoginData().setLoginData(responseBody['name'], responseBody['username'],
            responseBody['password']);
      }
    } catch (e) {
      throw Exception('Network Error Occured: $e');
    }
  }
}
