import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:flutter/material.dart';

class TOutlineButtonTheme {
  TOutlineButtonTheme._();

  //?: Light Theme
  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    elevation: 0,
    foregroundColor: kSecondaryColor,
    // backgroundColor: tPrimaryColor,
    side: const BorderSide(color: kSecondaryColor),
    padding: const EdgeInsets.symmetric(vertical: tDefaultSize),
    shape: const RoundedRectangleBorder(),
  ));

  //?: Dark Theme
  static final darkOutlineButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    elevation: 0,
    foregroundColor: kMinCreamColor,
    // backgroundColor: tSecondaryColor,
    side: const BorderSide(color: kMinCreamColor),
    padding: const EdgeInsets.symmetric(vertical: tDefaultSize),
    shape: const RoundedRectangleBorder(),
  ));
}
