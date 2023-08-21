import 'package:artroad/core/app_export.dart';
import 'package:flutter/material.dart';
import '../mycalendar_page/mycalendar_tcs.dart';
import 'favoritecalendar_tcs.dart';

class FavoritecalendarPage extends StatefulWidget {
  const FavoritecalendarPage({Key? key}) : super(key: key);

  @override
  _FavoritecalendarPageState createState() => _FavoritecalendarPageState();
}

class _FavoritecalendarPageState extends State<FavoritecalendarPage> {
  bool isTableCalendarVisible = true; // 초기에는 TableCalendar 보이도록

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fill,
          child: Container(
            height: getVerticalSize(836),
            width: double.maxFinite,
            padding: getPadding(top: 38, bottom: 38),
            child: Column(
              children: [
                // 로고
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: getPadding(left: 34),
                    child: Text(
                      "ArtRoad",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: theme.textTheme.displaySmall,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Favorite Calendar Button
                    ElevatedButton(
                      onPressed: () {
                        print("fTableCalendar");
                        setState(() {
                          isTableCalendarVisible = !isTableCalendarVisible;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: isTableCalendarVisible ? appTheme.blue100 : appTheme.blueGray50, // 색상 조건에 따라 변경
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.customBorderTL10,
                        ),
                      ),
                      child: Stack(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgMonthinlove,
                              height: getSize(26),
                              width: getSize(26),
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                    ),

                    // My Calendar Button
                    ElevatedButton(
                      onPressed: () {
                        print("mTableCalendar");
                        setState(() {
                          isTableCalendarVisible = !isTableCalendarVisible; // 토글 로직
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: isTableCalendarVisible ? appTheme.blueGray50 : appTheme.blue100, // 색상 조건에 따라 변경
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.customBorderTL10,
                        ),
                      ),
                      child: Stack(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgToday,
                              height: getSize(26),
                              width: getSize(26),
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                    )
                  ],
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgCalendar,
                        height: getVerticalSize(470),
                        width: getHorizontalSize(428),
                        radius: BorderRadius.circular(getHorizontalSize(8)),
                        alignment: Alignment.topCenter,
                      ),
                      if (isTableCalendarVisible)
                        Positioned(
                          top: -15,
                          left: 20,
                          right: 20,
                          child: fTableCalendarScreen(), // isTableCalendarVisible가 true인 경우에는 fTableCalendarScreen() 호출
                        ),
                      if (!isTableCalendarVisible)
                        Positioned(
                          top: -15,
                          left: 20,
                          right: 20,
                          child: mTableCalendarScreen(), // isTableCalendarVisible가 false인 경우에는 mTableCalendarScreen() 호출
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}