import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

class SystemInfo with ChangeNotifier {
  String? _os;
  String? _hostName;
  String? _javaVersion;

  String? get os => _os;
  String? get hostName => _hostName;
  String? get javaVersion => _javaVersion;

  Future<void> getSystemInfo() async {
    try {
      final result = await Process.run('java', [
        '-jar',
        'assets/java_codes/SystemInfo.jar',
      ]);

      if (result.exitCode == 0) {
        final jsonOutput = jsonDecode(result.stdout);
        _os = jsonOutput['OS'];
        _hostName = jsonOutput['Hostname'];
        _javaVersion = jsonOutput['JavaVersion'];
        notifyListeners();
        debugPrint("Os $_os\nJava: $_javaVersion");
      } else {
        debugPrint("Java Error: ${result.stderr}");
      }
    } catch (e) {
      debugPrint("Error Caught: $e");
    }
  }
}
