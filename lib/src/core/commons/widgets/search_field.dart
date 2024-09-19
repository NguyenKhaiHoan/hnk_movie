import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/search_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HSearchField extends StatelessWidget {
  const HSearchField(
      {super.key,
      this.hasSuffix,
      required this.hintText,
      required this.controller,
      this.onFieldSubmitted,
      this.onChanged,
      this.clear});

  final bool? hasSuffix;
  final String hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function()? clear;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          onChanged: onChanged ??
              (value) => ref
                  .read(searchStringProvider.notifier)
                  .update((state) => state = value),
          onFieldSubmitted: onFieldSubmitted,
          style:
              HAppStyle.paragraph2Regular.copyWith(color: HAppColor.whileColor),
          decoration: InputDecoration(
              filled: true,
              fillColor: HAppColor.anotherColor,
              contentPadding: hAppDefaultPaddingLR,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: HAppColor.bluePrimaryColor, width: 1),
                borderRadius: BorderRadius.circular(50),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50)),
              prefixIcon: const PhosphorIcon(
                PhosphorIconsRegular.magnifyingGlass,
                color: HAppColor.whileColor,
              ),
              suffixIcon: hasSuffix ?? false
                  ? InkWell(
                      onTap: clear,
                      child: const PhosphorIcon(PhosphorIconsRegular.x),
                    )
                  : const SizedBox(),
              hintText: hintText,
              hintStyle: HAppStyle.paragraph2Regular
                  .copyWith(color: HAppColor.whileColor)),
        );
      },
    );
  }
}
