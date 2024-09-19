import 'package:flutter/material.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';

class SectionAccount extends StatelessWidget {
  const SectionAccount({super.key, required this.icon, required this.title});

  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: HAppStyle.paragraph2Regular,
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: HAppColor.greyColor,
          size: 20,
        ),
      ),
    );
  }
}
