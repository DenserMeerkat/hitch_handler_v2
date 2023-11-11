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
      "content-type": "application/json",
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

  Future<Response> getRequest(String path,
      {Map<String, dynamic>? queryParameters}) async {
    Response response =
        Response(requestOptions: RequestOptions(path: "Error Response"));

    try {
      response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
    return response;
  }

  Future<Response> getRequestProtected(String path, String token,
      {Map<String, dynamic>? queryParameters}) async {
    Response response =
        Response(requestOptions: RequestOptions(path: "Error Response"));

    try {
      response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: {
          ...?options.headers,
          "authorization": token,
        }),
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
    return response;
  }

  Future<Response> postRequest(String path, Object data) async {
    Response response =
        Response(requestOptions: RequestOptions(path: "Error Response"));

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
    }
    return response;
  }

  Future<Response> postRequestProtected(String path, Object data, String token,
      {Map<String, dynamic>? queryParameters}) async {
    Response response =
        Response(requestOptions: RequestOptions(path: "Error Response"));

    try {
      response = await _dio.post(
        path,
        queryParameters: queryParameters,
        data: data,
        options: options.copyWith(headers: {
          ...?options.headers,
          "authorization": token,
        }),
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
    return response;
  }
}
