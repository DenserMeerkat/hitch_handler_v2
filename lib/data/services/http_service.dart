import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hitch_handler_v2/data/constants.dart';
import 'package:hitch_handler_v2/data/services/custom_interceptor.dart';

class HttpService {
  late Dio _dio;

  final baseUrl = baseURL;
  final Options options = Options(
    headers: {
      "api-key":
          dotenv.env['API_KEY'] ?? "9d54df40-c3ba-45c9-ba8b-55d8071f8dd2",
    },
  );

  HttpService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
  }

  initializeInterceptors() {
    _dio.interceptors.add(CustomInterceptors());
  }

  Future<Response> getRequest(String path) async {
    late Response response;

    try {
      response = await _dio.get(
        path,
        options: options,
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      throw Exception(e.message);
    }
    return response;
  }

  Future<Response> postRequest(String path, Object data) async {
    late Response response;

    try {
      response = await _dio.post(
        path,
        data: data,
        options: options,
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      throw Exception(e.message);
    }
    return response;
  }
}
