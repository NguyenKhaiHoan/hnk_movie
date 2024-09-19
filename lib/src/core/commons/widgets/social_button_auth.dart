import 'package:flutter/material.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/constants/size.dart';

class HSocialButtonAuth extends StatelessWidget {
  const HSocialButtonAuth({
    super.key,
    this.onPress,
    required this.width,
    required this.title,
    required this.icon,
    this.isLoading,
  });

  final double width;
  final String title;
  final IconData icon;
  final VoidCallback? onPress;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: OutlinedButton(
        onPressed: onPress,
        child: isLoading ?? false
            ? const Center(
                child: CircularProgressIndicator(
                  color: HAppColor.bluePrimaryColor,
                ),
              )
            : Row(children: [
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: hAppDefaultPaddingR,
                      child: Icon(
                        icon,
                        color: HAppColor.whileColor,
                      ),
                    )),
                Expanded(
                    flex: 7,
                    child: Text(
                      title,
                      style: HAppStyle.label2Bold
                          .copyWith(color: HAppColor.whileColor),
                    ))
              ]),
      ),
    );
  }
}
