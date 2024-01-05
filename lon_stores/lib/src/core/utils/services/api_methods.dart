import 'package:dio/dio.dart';

class HttpUtils {
  static const String url = 'https://fakestoreapi.com/products';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: url),
  );

  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool refresh = false,
    bool list = false,
    String cacheKey = '',
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.extra ??= <String, dynamic>{};
    requestOptions.extra!.addAll({
      "refresh": refresh,
      "list": list,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    try {
      var response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioException catch (error) {
      throw Exception(error);
    }
  }

  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    try {
      var response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        //  cancelToken: cancelToken,
      );

      return response.data;
    } on DioException catch (error) {
      throw Exception(error);
    }
  }

  Future put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    try {
      var response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        //  cancelToken: cancelToken,
      );

      return response.data;
    } on DioException catch (error) {
      throw Exception(error);
    }
  }

  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    try {
      var response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        //  cancelToken: cancelToken,
      );

      return response.data;
    } on DioException catch (error) {
      throw Exception(error);
    }
  }

  Future delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool refresh = false,
    bool list = false,
    String cacheKey = '',
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.extra ??= <String, dynamic>{};
    requestOptions.extra!.addAll({
      "refresh": refresh,
      "list": list,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    try {
      var response = await _dio.delete(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioException catch (error) {
      throw Exception(error);
    }
  }
}
