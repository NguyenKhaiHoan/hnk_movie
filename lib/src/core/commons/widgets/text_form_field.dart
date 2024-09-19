import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:flutter/material.dart';

class HTextFormField extends StatelessWidget {
  const HTextFormField(
      {super.key,
      required this.icon,
      this.isPassword,
      required this.hintText,
      required this.controller});

  final Icon icon;
  final bool? isPassword;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: isPassword ?? false
          ? TextInputType.visiblePassword
          : TextInputType.text,
      obscureText: isPassword ?? false,
      style: HAppStyle.paragraph2Regular.copyWith(color: HAppColor.whileColor),
      decoration: InputDecoration(
          contentPadding: hAppDefaultPaddingLR,
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: HAppColor.bluePrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(50),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: HAppColor.greyColor, width: 1),
              borderRadius: BorderRadius.circular(50)),
          prefixIcon: icon,
          hintText: hintText,
          hintStyle:
              HAppStyle.paragraph2Regular.copyWith(color: HAppColor.greyColor)),
    );
  }
}
