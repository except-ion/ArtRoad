import 'package:flutter/material.dart';
import 'package:artroad/src/provider/concert_provider.dart';
import 'package:artroad/src/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ConcertProvider()),
        // Add other providers here if needed
      ],
      child: const MaterialApp(
        title: 'My App',
        home: Home(),
      ),
    );
  }
}