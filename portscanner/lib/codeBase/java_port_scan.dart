  import '../export.dart';

  // Code to use the jar file of java

  void runJavaCode() async {
    final result = await Process.run('java', [
      '-jar',
      'assets/java_codes/portscan.jar','google.com',
    ], runInShell: true);

    debugPrint('Result: ${result.stdout}');
    debugPrint("Error: ${result.stderr}");
  }
