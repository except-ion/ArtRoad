import 'package:artroad/core/app_export.dart';
import 'package:flutter/material.dart';
import '../mycalendar_screen/mycalendar_tcs.dart';
import 'favoritecalendar_tcs.dart';
import 'max_num_of_weeks.dart';

class FavoritecalendarScreen extends StatefulWidget {
  const FavoritecalendarScreen({Key? key}) : super(key: key);

  @override
  _FavoritecalendarScreen createState() => _FavoritecalendarScreen();
}

class _FavoritecalendarScreen extends State<FavoritecalendarScreen> {
  bool isTableCalendarVisible = true; // 초기에는 TableCalendar 보이도록
  bool isFiveWeeks = MaxNumOfWeeks().calculateMaxWeeksInMonth(DateTime.now());

  // isFiveWeeks 변수 업데이트 메서드
  void updateIsFiveWeeks(bool newValue) {
    setState(() {
      isFiveWeeks = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // logo
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: getPadding(top: 30, left: 30),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
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
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
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
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
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

        Expanded(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Transform.scale(
                scale: 1.0,
                // scale: isFiveWeeks ? 1.0 : 1.5,
                child: CustomImageView(
                  imagePath: ImageConstant.imgCalendar,
                  alignment: Alignment.topCenter,
                ),
              ),
              if (isTableCalendarVisible)
                Positioned(
                  top: -10,
                  left: 10,
                  right: 10,
                  child: fTableCalendarScreen(
                      isFiveWeeks: isFiveWeeks,
                      updateIsFiveWeeks: updateIsFiveWeeks
                  ), // isTableCalendarVisible가 true인 경우에는 fTableCalendarScreen() 호출
                ),
              if (!isTableCalendarVisible)
                Positioned(
                  top: -10,
                  left: 10,
                  right: 10,
                  child: mTableCalendarScreen(), // isTableCalendarVisible가 false인 경우에는 mTableCalendarScreen() 호출
                ),
            ],
          ),
        ),
      ],
    );
  }
}