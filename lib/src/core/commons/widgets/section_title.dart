import 'package:flutter/material.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/core/constants/translation.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(
      {super.key, required this.title, this.onPressed, this.seeAll});

  final String title;
  final VoidCallback? onPressed;
  final bool? seeAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: hAppDefaultPaddingLR,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: HAppStyle.heading4Style,
          ),
          seeAll ?? true
              ? GestureDetector(
                  onTap: onPressed,
                  child: Text(
                    HAppTranslation.seeAll.t(context),
                    style: HAppStyle.paragraph2Regular
                        .copyWith(color: HAppColor.bluePrimaryColor),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
