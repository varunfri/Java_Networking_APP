import 'package:portscanner/export.dart';

class GeoProvider with ChangeNotifier {
  String? _status;
  String? _country;
  String? _countryCode;
  String? _region;
  String? _regionName;
  String? _city;
  String? _zip;
  double? _lat;
  double? _lon;
  String? _timeZone;
  String? _isp;
  String? _org;
  String? _as;
  String? _query;

  Future<void> getLocation() async {
    try {
       
      final result = await Process.run('java', [
        '-jar',
        'assets/java_codes/geolocation.jar',
      ]);

      debugPrint("GeoLocation ExitCode: ${result.exitCode}");
      debugPrint("Stdout: ${result.stdout}\t Stderr: ${result.stderr}");
      if (result.exitCode == 0) {
        final data = jsonDecode(result.stdout);

        _status = data['status'];
        _country = data['country'];
        _countryCode = data['countryCode'];
        _region = data['region'];
        _regionName = data['regionName'];
        _city = data['city'];
        _zip = data['zip'];
        _lat = data['lat'];
        _lon = data['lon'];
        _org = data['org'];
        _timeZone = data['timezone'];
        _isp = data['isp'];
        _as = data['as'];
        _query = data['query'];

        debugPrint(
          "$_status,$_country, $_countryCode ,$_region ,$_regionName,$_city,$_zip  ,$_lat ,$_lon  ,$_org  ,$_timeZone  ,$_isp  ,$_as  $_query ",
        );
      } else {
        debugPrint("Else Error: ${result.stderr} \n ${result.stdout}");
      }
    } catch (e) {
      debugPrint("Error Caught: $e");
    }
  }

  String? get status => _status;
  String? get country => _country;
  String? get countryCode => _countryCode;
  String? get region => _region;
  String? get regionName => _regionName;
  String? get city => _city;
  String? get zip => _zip;
  double? get lat => _lat;
  double? get lon => _lon;
  String? get org => _org;
  String? get timeZone => _timeZone;
  String? get isp => _isp;
  String? get as => _as;
  String? get query => _query;

  void clearData() {}
}
