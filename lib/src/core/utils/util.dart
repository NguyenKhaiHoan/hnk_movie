library utils;

import 'package:flutter/material.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/core/constants/size.dart';

class HAppUtils {
  static void buildModalBottomSheet(
    BuildContext context,
    Widget child,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: HAppColor.anotherColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(hAppDefaultPadding,
                        hAppDefaultPadding, hAppDefaultPadding, 0),
                    child: Column(
                      children: [child],
                    ))));
      },
    );
  }

  static String formatDuration(int totalSeconds) {
    final duration = Duration(seconds: totalSeconds);
    final minutes = duration.inMinutes;
    final seconds = totalSeconds % 60;
    return '$minutes min $seconds sec';
  }
}
