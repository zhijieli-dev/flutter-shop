import 'package:dio/dio.dart';
import 'package:flutter_shop/constants/index.dart';

class DioRequest {
  final Dio _dio = Dio();
  
  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GlobalConstants.TIMEOUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIMEOUT);

    addInterceptor();
  }

  void addInterceptor() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest:(request, handler) {
        handler.next(request);
      },
      onResponse:(response,handler) {
        handler.next(response);
      },
      onError: (error, handler) {
        handler.reject(error);
      }
    ));
  }

  Future<dynamic> get(String url, { Map<String, dynamic>? params, }) async {
    try {
      final response = await _dio.get(url, queryParameters: params);
      return response.data;
    } on DioException {
      rethrow;
    }
  }
}

final dioRequest = DioRequest();