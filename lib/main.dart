import 'package:artroad/src/provider/condetail_provider.dart';
import 'package:flutter/material.dart';
import 'package:artroad/src/provider/concert_provider.dart';
import 'package:artroad/src/provider/facility_provider.dart';
import 'package:artroad/src/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConcertProvider()
          ),
        ChangeNotifierProvider(
          create: (context) => FacilityProvider()
          ),
        ChangeNotifierProvider(
          create: (context) => ConcertDetailProvider()
          ),
      ],
      child: const MaterialApp(
        title: 'My App',
        home: Home(),
      ),
    );
  }
}