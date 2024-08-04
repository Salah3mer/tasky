import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tasky/core/api/dio_client.dart';
import 'package:tasky/core/api/end_points.dart';
import 'package:tasky/core/utils/app_constans.dart';
import 'package:tasky/core/utils/local/cash_helper.dart';
import 'package:tasky/core/utils/server_locator.dart';
import 'package:tasky/features/auth/data/repository/auth_repository.dart';
import 'package:tasky/features/auth/data/repository/auth_repository_impl.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  final Dio? client;
  LoggingInterceptor({this.client});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${AppConstans.token}',
      'Accept': 'application/json',
    };
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    if (err.response?.statusCode == 401) {
      String? newToken = await _refreshToken();
      err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
      return handler.resolve(await client!.fetch(err.requestOptions));
    }
    return handler.next(err);
  }

  Future<String?> _refreshToken() async {
    final response = await client!
        .get('${EndPoints.refeshToken}${AppConstans.reFreshtoken!}');

    String newToken = response.data['access_token'];
    print(newToken);
    if (newToken.isNotEmpty) {
      AppConstans.token = newToken;
      CashHelper.setString(key: AppConstans.tokenKey, value: newToken);
      return newToken;
    } else {
      return null;
    }
  }
  // return false;
}
