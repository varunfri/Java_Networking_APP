  import '../export.dart';

  // Code to use the jar file of java

  void runJavaCode() async {
    final result = await Process.run('java', [
      '-jar',
      'assets/java_codes/Main.jar',
    ], runInShell: true);

    debugPrint('Result: ${result.stdout}');
    debugPrint("Error: ${result.stderr}");
  }
