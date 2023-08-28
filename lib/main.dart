import 'package:artroad/src/provider/condetail_provider.dart';
import 'package:artroad/src/provider/facdetail_provider.dart';
import 'package:flutter/material.dart';
import 'package:artroad/src/provider/search/concert_provider.dart';
import 'package:artroad/src/provider/calendar/concert_provider.dart';
import 'package:artroad/src/provider/search/facility_provider.dart';
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
          create: (context) => ConcertSearchProvider()
          ),
        ChangeNotifierProvider(
        create: (context) => ConcertCalendarProvider()
        ),
        ChangeNotifierProvider(
          create: (context) => FacilityProvider()
          ),
        ChangeNotifierProvider(
          create: (context) => ConcertDetailProvider()
          ),
          ChangeNotifierProvider(
          create: (context) => FacilityDetailProvider()
          ),
      ],
      child: const MaterialApp(
        title: 'My App',
        home: Home(),
      ),
    );
  }
}