import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api_constant.dart';
import 'package:flutter/material.dart';

class AuthRepo {
  final _dio = Dio();

  Future authLogin() async {
    try {
      final response = await _dio.getUri(
        Uri.parse(ApiConstant.loginUrl),
      );
    } on DioExceptionType catch (e) {
      if (e.runtimeType == DioExceptionType.badResponse) {}
      debugPrint(e.toString());
    }
  }
}
