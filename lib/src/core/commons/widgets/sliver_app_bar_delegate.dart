import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hnk_movie/src/config/theme/color.dart';

class HSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  HSliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
        child: Container(
      color: HAppColor.otherColor,
      child: child,
    ));
  }

  @override
  bool shouldRebuild(HSliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
