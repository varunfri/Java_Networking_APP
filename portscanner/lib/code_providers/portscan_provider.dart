import 'package:portscanner/export.dart';

class PortScan with ChangeNotifier {
  List<int> _ports = [];
  String? _url = 'google.com';

  List<int> get ports => _ports;

  set url(String web) {
    _url = web;
  }

  Future<void> getPorts() async {
    try {
      // await Future.delayed(Duration(seconds: 2));
      final result = await Process.run('java', [
        '-jar',
        'assets/java_codes/portscan.jar',
        _url ?? "google.com",
      ]);
      debugPrint(_url);
      if (result.exitCode == 0) {
        final data = jsonDecode(result.stdout);
        debugPrint("Data: $data");
        _ports = List<int>.from(data['OpenPorts']);
        notifyListeners();
        debugPrint("Ports: $_ports");
      } else {
        debugPrint(
          "PortScan Exit Code: ${result.exitCode}\n Output: ${result.stdout}\n Error: ${result.stderr}",
        );
      }
    } catch (e) {
      debugPrint("Error Caught: $e");
    }
  }

  void cleardata() {
    ports.clear();
    notifyListeners();
  }
}
