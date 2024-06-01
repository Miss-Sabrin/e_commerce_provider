import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  //?: Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: kprimarayColor,
    backgroundColor: kSecondaryColor,
    side: const BorderSide(color: kRichBlackColor),
    shape: const RoundedRectangleBorder(),
    padding: const EdgeInsets.symmetric(vertical: tDefaultSize),
  ));

  //?: Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: kMinCreamColor,
    backgroundColor: kPrimaryColor,
    side: const BorderSide(color: kprimarayColor),
    padding: const EdgeInsets.symmetric(vertical: tDefaultSize),
    shape: const RoundedRectangleBorder(),
  ));
}
