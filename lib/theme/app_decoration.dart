import 'package:flutter/material.dart';
import 'package:artroad/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fill => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get fill1 => BoxDecoration(
        color: appTheme.blueGray50,
      );
  static BoxDecoration get fill2 => BoxDecoration(
        color: appTheme.blue100,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );

  static BorderRadius customBorderTL10 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        10,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        10,
      ),
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
