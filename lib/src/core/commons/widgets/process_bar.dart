import 'package:flutter/widgets.dart';
import 'package:hnk_movie/src/config/theme/color.dart';

class HProgressBar extends StatelessWidget {
  const HProgressBar(
      {super.key,
      required this.width,
      required this.height,
      required this.progress});

  final double width;
  final double height;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: HAppColor.greyColor, borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          Container(
            width: width * progress,
            height: height,
            decoration: BoxDecoration(
                color: HAppColor.bluePrimaryColor,
                borderRadius: BorderRadius.circular(8)),
          )
        ],
      ),
    );
  }
}
