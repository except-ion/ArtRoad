import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodySmallBlueA400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueA400,
      );
  static get bodySmallBlueA40001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueA40001,
      );
}

extension on TextStyle {
  TextStyle get oleoScriptSwashCaps {
    return copyWith(
      fontFamily: 'Oleo Script Swash Caps',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
