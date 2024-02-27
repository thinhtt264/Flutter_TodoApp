import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            background: Colors.white,
            onBackground: Colors.black,
            primary: Colors.yellow,
            onPrimary: Colors.black,
            secondary: Colors.greenAccent,
            onSecondary: Colors.white),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
