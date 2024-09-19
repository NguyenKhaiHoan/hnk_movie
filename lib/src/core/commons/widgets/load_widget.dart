import 'package:flutter/material.dart';
import 'package:hnk_movie/src/config/theme/color.dart';

class LoadingWidgetItem extends StatelessWidget {
  const LoadingWidgetItem({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: const Center(
        child: CircularProgressIndicator(
          color: HAppColor.bluePrimaryColor,
        ),
      ),
    );
  }
}
