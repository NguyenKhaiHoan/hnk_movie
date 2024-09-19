import 'package:flutter/material.dart';
import 'package:hnk_movie/src/config/theme/color.dart';

class LoadingImageWidget extends StatelessWidget {
  const LoadingImageWidget({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: SizedBox(
        height: height ?? double.infinity,
        width: width ?? MediaQuery.of(context).size.width,
        child: const Center(
            child:
                CircularProgressIndicator(color: HAppColor.bluePrimaryColor)),
      ),
    );
  }
}
