

import 'package:flutter/material.dart';
import 'package:s_pay/config/constants/colors.dart';

class SProgressIndicatorTheme {
  SProgressIndicatorTheme._();

  static final lightProgressIndicatorTheme = ProgressIndicatorThemeData(
    circularTrackColor: SColors.secondary,
    color: Colors.white
  );

    static final darkProgressIndicatorTheme = ProgressIndicatorThemeData(
    circularTrackColor: SColors.primary,
    color: Colors.white
  );
}