import 'package:artroad/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:artroad/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:artroad/src/provider/condetail_provider.dart';
import 'package:artroad/src/provider/facdetail_provider.dart';
import 'package:artroad/src/provider/ranking_provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:artroad/src/provider/search/concert_provider.dart';
import 'package:artroad/src/provider/calendar/concert_provider.dart';
import 'package:artroad/src/provider/search/facility_provider.dart';
import 'package:provider/provider.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  KakaoSdk.init(
    nativeAppKey: '66389c442b9dba0350c2d6c94286380a',
    javaScriptAppKey: '708757a1c33c4ef4738b67842bca34dd'
  );

  //firebase 사용을 위해 초기화 메소드 호출
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ConcertSearchProvider()),
        ChangeNotifierProvider(create: (context) => ConcertCalendarProvider()),
        ChangeNotifierProvider(create: (context) => FacilityProvider()),
        ChangeNotifierProvider(create: (context) => ConcertDetailProvider()),
        ChangeNotifierProvider(create: (context) => FacilityDetailProvider()),
        ChangeNotifierProvider(create: (context) => RankingProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.standard,
        ),
        title: 'artroad',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.loginScreen,
        routes: AppRoutes.routes,
      ),
    );
  }
}
