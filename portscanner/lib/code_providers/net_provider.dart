import 'dart:convert';

import 'package:portscanner/export.dart';

class Netinfoprovider with ChangeNotifier {
  String? _localip;
  String? _publicip;
  String? _interface;

  Future<void> getNetInfo() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      final result = await Process.run('java', [
        '-jar',
        'assets/java_codes/ipdetails.jar',
      ]);

      debugPrint("ExitCode: ${result.exitCode}");

      if (result.exitCode == 0) {
        final data = jsonDecode(result.stdout);
        debugPrint("$data");
        _localip = data['local_ip'];
        _publicip = data['public_ip'];
        _interface = data['interface_connected'];
        notifyListeners();
        debugPrint(
          "Local: $_localip\nPublic: $_publicip\nInterface: $_interface",
        );
      } else {
        debugPrint("Java Error: ${result.stderr}: ${result.stdout}");
      }
    } catch (e) {
      debugPrint("Error Caught: $e");
    }
  }

  // create get to all variables
  String? get localip => _localip;
  String? get publicip => _publicip;
  String? get interface => _interface;
}
