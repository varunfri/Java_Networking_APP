import 'package:portscanner/export.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Color(0x00358195),
    onPrimary: Color(0x00ffffff),
    secondary: Color(0x005DB7CE),
    onSecondary: Colors.orange.shade100,
    error: Colors.red,
    onError: Colors.red,
    surface: Color(0x00C6E6ED),
    onSurface: Color(0x00272727),
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme(
    primary: Color(0xFF0A5365),
    onPrimary: Color(0xFF486161),
    secondary: Color(0xFF358195),
    onSecondary: Color(0xFF358195),
    error: Colors.redAccent,
    onError: Colors.redAccent,
    surface: Color(0xFF486161),
    onSurface: Color(0xFF486161),
    brightness: Brightness.dark,
  ),
);
