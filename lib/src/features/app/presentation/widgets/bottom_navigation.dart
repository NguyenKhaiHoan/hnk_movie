// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/core/constants/translation.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.onPressed,
    required this.currentIndex,
  });

  final Function(int index) onPressed;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: BottomNavigationBar(
        backgroundColor: HAppColor.otherColor,
        currentIndex: currentIndex,
        onTap: (value) => onPressed(value),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: HAppColor.whileColor,
        selectedItemColor: HAppColor.bluePrimaryColor,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(PhosphorIconsRegular.house),
              label: HAppTranslation.home.t(context)),
          BottomNavigationBarItem(
            icon: const Icon(PhosphorIconsRegular.magnifyingGlass),
            label: HAppTranslation.explore.t(context),
          ),
          BottomNavigationBarItem(
            icon: const Icon(PhosphorIconsRegular.bookmarkSimple),
            label: HAppTranslation.favorite.t(context),
          ),
          BottomNavigationBarItem(
            icon: const Icon(PhosphorIconsRegular.userCircle),
            label: HAppTranslation.account.t(context),
          ),
        ],
      ),
    );
  }
}
