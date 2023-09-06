import 'package:artroad/firebase_options.dart';
import 'package:artroad/src/provider/search/concert_provider.dart';
import 'package:artroad/src/provider/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:artroad/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:artroad/src/provider/condetail_provider.dart';
import 'package:artroad/src/provider/facdetail_provider.dart';
import 'package:artroad/src/provider/ranking_provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:artroad/src/provider/search/facility_provider.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  KakaoSdk.init(nativeAppKey: dotenv.env['KAKAO_NATIVE_APP_KEY']);

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
          ChangeNotifierProvider(create: (context) => ConcertProvider()),
          ChangeNotifierProvider(create: (context) => FacilityProvider()),
          ChangeNotifierProvider(create: (context) => ConcertDetailProvider()),
          ChangeNotifierProvider(create: (context) => FacilityDetailProvider()),
          ChangeNotifierProvider(create: (context) => RankingProvider()),
          ChangeNotifierProvider(create: (context) => UserProvider()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp(
            theme: ThemeData(
              visualDensity: VisualDensity.standard,
              scaffoldBackgroundColor: Colors.white,
            ),
            title: 'artroad',
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.loginScreen,
            routes: AppRoutes.routes,
          ),
        ));
  }
}
