


import 'export.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=> Netinfoprovider()),
    ChangeNotifierProvider(create: (_)=> LocalTimeProvider()),
    ChangeNotifierProvider(create: (_) => SystemInfo()),
    ChangeNotifierProvider(create: (_)=> PortScan()),
    ChangeNotifierProvider(create: (_)=> GeoProvider()),
    ChangeNotifierProvider(create: (_)=> LocationAccess ()),
    ChangeNotifierProvider(create: (_)=> ReverseIpProvider()),
    ChangeNotifierProvider(create: (_) => WhoisProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Networking App",
      // theme: lightMode,
      // darkTheme: darkMode,
      //checking with remote connections
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}
