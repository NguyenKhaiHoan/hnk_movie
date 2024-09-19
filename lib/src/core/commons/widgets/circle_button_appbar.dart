import 'package:flutter/material.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/core/commons/widgets/blur_widget.dart';

class HCircleIcon extends StatelessWidget {
  final Icon icon;
  final Function()? onTap;

  const HCircleIcon({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlurWidget(
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: HAppColor.whileColor.withOpacity(0.1)),
        child: GestureDetector(onTap: onTap, child: icon),
      ),
    );
  }
}
