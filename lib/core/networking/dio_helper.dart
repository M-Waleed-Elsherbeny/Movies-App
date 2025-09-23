import 'package:dio/dio.dart';
import 'package:movies_app/core/config/api_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;
  static Dio? initialDio() {
    final Duration timeout = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!.options.baseUrl = ApiConfig.baseApiUrl;
      dio!.options.connectTimeout = timeout;
      dio!.options.receiveTimeout = timeout;
      prettyDioLogger();
      return dio;
    } else {
      return dio;
    }
  }

  static void prettyDioLogger() {
    dio!.interceptors.add(
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
}
