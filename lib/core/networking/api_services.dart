import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/core/config/api_config.dart';

class ApiServices {
  Dio? dio;
  ApiServices(this.dio);

  Future<Response> getMovies({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      final Response response = await dio!.get(
        endPoint,
        queryParameters: {
          "api_key": ApiConfig.apiKey,
          "language": "en-US",
          "sort_by": "popularity.desc",
        },
      );
      if (response.statusCode == 200) {
        log("Success getMovies");
        return response;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
