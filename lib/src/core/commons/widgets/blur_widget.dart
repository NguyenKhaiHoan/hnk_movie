import 'dart:ui';

import 'package:flutter/material.dart';

class BlurWidget extends StatelessWidget {
  const BlurWidget(
      {super.key,
      this.figmaX,
      this.figmaY,
      required this.child,
      this.opacity,
      this.borderRadius});

  final double? figmaX;
  final double? figmaY;
  final double? opacity;
  final BorderRadius? borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(100),
      child: ClipRect(
          child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: figmaX ?? 10,
                sigmaY: figmaY ?? 10,
              ),
              child: Opacity(
                opacity: opacity ?? 0.7,
                child: child,
              ))),
    );
  }
}
