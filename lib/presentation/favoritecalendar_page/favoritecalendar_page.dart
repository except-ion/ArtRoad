import 'package:artroad/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class FavoritecalendarPage extends StatelessWidget {
  const FavoritecalendarPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fill,
          child: Container(
            height: getVerticalSize(
              836,
            ),
            width: double.maxFinite,
            padding: getPadding(
              top: 38,
              bottom: 38,
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    margin: getMargin(
                      top: 29,
                      right: 7,
                    ),
                    color: appTheme.blueGray50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.customBorderTL10,
                    ),
                    child: Container(
                      height: getVerticalSize(
                        39,
                      ),
                      width: getHorizontalSize(
                        54,
                      ),
                      padding: getPadding(
                        left: 14,
                        top: 6,
                        right: 14,
                        bottom: 6,
                      ),
                      decoration: AppDecoration.fill1.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderTL10,
                      ),
                      child: Stack(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgToday,
                            height: getSize(
                              26,
                            ),
                            width: getSize(
                              26,
                            ),
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: getVerticalSize(
                      538,
                    ),
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 0,
                            margin: getMargin(
                              top: 30,
                              right: 66,
                            ),
                            color: appTheme.blue100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusStyle.customBorderTL10,
                            ),
                            child: Container(
                              height: getVerticalSize(
                                39,
                              ),
                              width: getHorizontalSize(
                                54,
                              ),
                              padding: getPadding(
                                left: 14,
                                top: 6,
                                right: 14,
                                bottom: 6,
                              ),
                              decoration: AppDecoration.fill2.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.customBorderTL10,
                              ),
                              child: Stack(
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgMonthinlove,
                                    height: getSize(
                                      26,
                                    ),
                                    width: getSize(
                                      26,
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgCalendar,
                          height: getVerticalSize(
                            470,
                          ),
                          width: getHorizontalSize(
                            428,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              8,
                            ),
                          ),
                          alignment: Alignment.bottomCenter,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: getPadding(
                              left: 34,
                            ),
                            child: Text(
                              "ArtRoad",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.displaySmall,
                            ),
                          ),
                        ),
                      ],
                    ),
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
