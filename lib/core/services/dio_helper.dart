import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/core/config/api_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static final Dio dio = Dio();
  DioHelper() {
    initDio();
  }

  initDio() {
    dio.options.baseUrl = ApiConfig.baseApiUrl;
    dio.options.headers = {"Authorization": "Bearer ${ApiConfig.tokenApiKey}"};
    addPrettyLogger();
  }

  void addPrettyLogger() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      final Response response = await dio.get(
        "/discover/movie",
        queryParameters: {
          "api_key": ApiConfig.apiKey,
          "language": "en-US",
          "sort_by": "popularity.desc",
        },
      );
      if (response.statusCode == 200) {
        log("Success");
        return response;
      }
      throw Exception(response.statusMessage);
    } on DioException catch (e) {
      
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
