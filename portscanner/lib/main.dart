import 'export.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => LocalTimeProvider(),
//       child: const MyApp(),
//     ),
//   );
// }

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=> LocalTimeProvider()),
    ChangeNotifierProvider(create: (_) => SystemInfo()),
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
