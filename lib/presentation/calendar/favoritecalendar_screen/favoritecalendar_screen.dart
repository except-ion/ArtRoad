import 'package:artroad/core/app_export.dart';
import 'package:flutter/material.dart';
import '../mycalendar_screen/mycalendar_tcs.dart';
import 'favoritecalendar_tcs.dart';

class FavoritecalendarScreen extends StatefulWidget {
  const FavoritecalendarScreen({Key? key}) : super(key: key);

  @override
  _FavoritecalendarScreen createState() => _FavoritecalendarScreen();
}

class _FavoritecalendarScreen extends State<FavoritecalendarScreen> {
  bool isTableCalendarVisible = true; // 초기에는 TableCalendar 보이도록

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          // logo
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: getPadding(top: 30, left: 30),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.transparent, Colors.white], // 그라데이션 색상 설정
                    stops: [0.0, 1.0], // 그라데이션 위치 설정
                  ).createShader(bounds);
                },
                child: Text(
                  "ArtRoad",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontSize: 30.0, // 폰트 사이즈 조절
                    fontWeight: FontWeight.normal, // 폰트 굵기 조절
                    color: Colors.grey, // 텍스트 색상 설정 (그라데이션에 의해 가려지므로 원하는 색상 사용 가능)
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Favorite Calendar Button
              InkWell(
                onTap: () {
                  print("fTableCalendar");
                  setState(() {
                    isTableCalendarVisible = !isTableCalendarVisible;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                  decoration: BoxDecoration(
                    color: isTableCalendarVisible ? appTheme.blue100 : appTheme.blueGray50,
                    borderRadius: BorderRadiusStyle.customBorderTL10,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgMonthinlove,
                    height: 23,
                    width: 23,
                  ),
                ),
              ),

              // My Calendar Button
              InkWell(
                onTap: () {
                  print("mTableCalendar");
                  setState(() {
                    isTableCalendarVisible = !isTableCalendarVisible;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                  decoration: BoxDecoration(
                    color: isTableCalendarVisible ? appTheme.blueGray50 : appTheme.blue100,
                    borderRadius: BorderRadiusStyle.customBorderTL10,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgToday,
                    height: 23,
                    width: 23,
                  ),
                ),
              ),
            ],
          ),

          Container(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgCalendar,
                  alignment: Alignment.topCenter,
                ),
                if (isTableCalendarVisible)
                  const fTableCalendarScreen(),
                if (!isTableCalendarVisible)
                  const mTableCalendarScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}