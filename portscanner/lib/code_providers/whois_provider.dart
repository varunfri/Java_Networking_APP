import 'package:portscanner/export.dart';

class WhoisProvider with ChangeNotifier {
  String? _domainName;
  String? _creationDate;
  String? _expiryDate;
  String? _registrar;
  String? _nameServers;

  String? get domainName => _domainName;
  String? get creationDate => _creationDate;
  String? get expiryDate => _expiryDate;
  String? get registrar => _registrar;
  String? get nameServers => _nameServers;

  Future<void> getWhois(String domain) async {
    try {
      final result = await Process.run('java', [
        '-jar',
        'assets/java_codes/whoislookup.jar',
        domain,
      ]);
      debugPrint(
        "ExitCode: ${result.exitCode} \t Output: ${result.stdout}\tError ${result.stderr}",
      );
      if (result.exitCode == 0) {
        final data = jsonDecode(result.stdout);
        _domainName = data['DomainName'];
        _creationDate = data['CreationDate'];
        _expiryDate = data['ExpiryDate'];
        _registrar = data['Registrar'];
        _nameServers = data['NameServers'];
        debugPrint("Domain Name: $_domainName\t Name Servers: $_nameServers");

      } else {
        debugPrint("Java Error: ${result.stderr}");
      }
    } catch (e) {
      debugPrint("Error Caught: $e");
    }
  }
}
