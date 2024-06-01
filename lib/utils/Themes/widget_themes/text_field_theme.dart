import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:flutter/material.dart';




class TTextFormFieldFieldTheme {

  TTextFormFieldFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
        border: OutlineInputBorder(),
        prefixIconColor: kSecondaryColor,
        floatingLabelStyle: TextStyle(color: kSecondaryColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2,color: kSecondaryColor)
        )
      );
  static InputDecorationTheme darkInputDecorationTheme =
  const InputDecorationTheme(
      border: OutlineInputBorder(),
      prefixIconColor: kSecondaryColor,
      floatingLabelStyle: TextStyle(color: kPrimaryColor),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2,color: kPrimaryColor)
      )
  );
}