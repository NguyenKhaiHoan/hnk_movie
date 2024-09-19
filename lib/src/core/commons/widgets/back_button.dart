import 'package:flutter/material.dart';
import 'package:hnk_movie/src/core/commons/widgets/circle_button_appbar.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BackCircleButton extends StatelessWidget {
  const BackCircleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        gapW16,
        HCircleIcon(
          icon: const Icon(PhosphorIconsRegular.caretLeft),
          onTap: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
