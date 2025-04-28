import 'package:portscanner/export.dart';

class ReverseIpProvider with ChangeNotifier {
  String? _hostAddress;
  String? _finderInfo;
  String? _hostIp;
  String? _hostName;

  String? get hostAddress => _hostAddress;
  String? get finderInfo => _finderInfo;
  String? get hostIp => _hostIp;
  String? get hostName => _hostName;

  Future<void> getReverseIP({required String domain}) async {
    try {
      final result = await Process.run('java', [
        '-jar',
        'assets/java_codes/reverseip.jar',
        domain,
      ]);
      debugPrint(
        '${result.exitCode} \t Outpur:${result.stdout}\t Error: ${result.stderr} ',
      );
      if (result.exitCode == 0) {
        final data = jsonDecode(result.stdout);
        _hostAddress = data['host_address'];
        _finderInfo = data['finder_info'];
        _hostIp = data['host_ip'];
        _hostName = data['host_name'];
        notifyListeners();
        debugPrint("$_hostAddress\t$_finderInfo\t$_hostIp\t$_hostName");
      } else {
        debugPrint("Java Error: ${result.stderr}");
      }
    } catch (e) {
      debugPrint("Error Caught: $e");
    }
  }
}
