import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:restart_app/restart_app.dart';
import 'package:tasky/core/api/end_points.dart';
import 'package:tasky/core/utils/app_constans.dart';
import 'package:tasky/core/utils/local/cash_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  Dio? dio;
  String? token;

  DioClient(
    Dio? dioC,
  ) {
    dio = dioC ?? Dio();

    dio!.options
      ..baseUrl = EndPoints.baseUrl
      ..followRedirects = false
      ..headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppConstans.token}',
        'Accept': 'application/json',
      };

    dio!.interceptors.add(interceptorsWrapper());

// customization

    dio!.interceptors.add(prettyDioLogger());
  }

  prettyDioLogger() => PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
      filter: (options, args) {
        // don't print requests with uris containing '/posts'
        if (options.path.contains('/posts')) {
          return false;
        }
        // don't print responses with unit8 list data
        return !args.isResponse || !args.hasUint8ListData;
      });

  interceptorsWrapper() => InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers = {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${AppConstans.token}',
            'Accept': 'application/json',
          };
          return handler.next(options);
        },
        onError: (DioException err, ErrorInterceptorHandler handler) async {
          debugPrint(
              'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
          if (err.response?.statusCode == 401) {
            String? newToken = await _refreshToken();
            err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
            return handler.resolve(await dio!.fetch(err.requestOptions));
          }
          return handler.next(err);
        },
      );

  Future<String?> _refreshToken() async {
    final response =
        await dio!.get('${EndPoints.refeshToken}${AppConstans.reFreshtoken!}');

    String newToken = response.data['access_token'];
    if (newToken.isNotEmpty) {
      AppConstans.token = newToken;
      CashHelper.setString(key: AppConstans.tokenKey, value: newToken);
      return newToken;
    } else if (response.statusCode != 200) {
      // clear token
      // clear RToken
      // Navigate to login screen
      Restart.restartApp();
      // Restart.restartApp(webOrigin: '[your main route]');
      return null;
    } else {
      return null;
    }
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio!.get(
        uri,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      throw FormatException("Unable to process the data $e");
    }
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: Options(
            headers: headers,
            contentType:
                'multipart/form-data; boundary=<calculated when request is sent'),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print("%%%%%%%%%%%%%%%%%%%%%");
      print(response.headers);
      print(response.data);
      print("%%%%%%%%%%%%%%%%%%%%%");
      return response;
    } catch (e) {
      throw FormatException("Unable to process the data $e");
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio!.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      throw FormatException("Unable to process the data $e");
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio!.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      throw FormatException("Unable to process the data $e");
    }
  }
}
