import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool? isEnabled;
  final TextEditingController? controller;
  final bool isPassword;
  final IconData? prefixIcon;

  const MyTextField(
      {super.key,
      required this.hintText,
      this.controller,
      this.isPassword = false,
      this.isEnabled,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 8, bottom: 8, left: 5, right: 5),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        enabled: isEnabled,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefix: Icon(prefixIcon),
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          border: InputBorder.none,
          suffixIcon: isPassword
              ? Icon(
                  Icons.visibility_off,
                  color: Colors.grey.shade400,
                )
              : null,
        ),
        obscureText: isPassword ? true : false,
      ),
    );
  }
}
