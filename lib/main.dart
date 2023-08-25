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
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // MultiProvider를 통해 여러가지 Provider를 관리
        home: MultiProvider(
          
            // ChangeNotifierProvider 통해 변화에 대해 구독
            providers: [
              ChangeNotifierProvider(
                  create: (BuildContext context) => ConcertProvider())
            ],
            child:
                Home() // home.dart 
            ));
  }
}