import 'package:dio/dio.dart';
import 'package:portscanner/export.dart';

class NetworkStatus {
  final _dio = Dio();
  Future<int?> status() async {
    try {
      final result = await _dio.get("http://google.com");
      if (result.statusCode == 200) {
        debugPrint("Error: ${result.statusCode}");
        return result.statusCode;
      } else {
        debugPrint("Error: ${result.statusCode}");
        return result.statusCode;
      }
    } on DioException catch (e) {
      debugPrint("Error: $e");
      return e.response?.statusCode ?? 500;
    }
  }
}
