import 'package:dio/dio.dart';

class NetworkStatus {
  final _dio = Dio();
  Future<int?> status() async {
    try {
      final result = await _dio.get("http://google.com");
      if (result.statusCode == 200) {
        return result.statusCode;
      } else {
        return result.statusCode;
      }
    } on DioException catch (e) {
      return e.response?.statusCode ?? 500;
    }
  }
}
