import 'package:portscanner/export.dart';
import 'dart:async';
class LocalTimeProvider with ChangeNotifier {
  DateTime _dateTime = DateTime.now();

  DateTime get dateTime => _dateTime;

  LocalTimeProvider() {
      Timer.periodic(const Duration(seconds: 1), (timer) {
      _dateTime = DateTime.now();
      notifyListeners();
    });
  }
}
