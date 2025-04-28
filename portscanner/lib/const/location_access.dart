import 'package:portscanner/export.dart';

class LocationAccess with ChangeNotifier {
  bool? _serviceEnabled;
  bool? get serviceEnabled => _serviceEnabled;

  Future<void> getLocation() async {
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
  }
}
