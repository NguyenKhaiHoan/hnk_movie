import 'package:flutter/material.dart';
import 'package:hnk_movie/src/app_localization.dart';

extension StringExtension on String {
  String intelliTrim() {
    return length > 30 ? '${substring(0, 30)}...' : this;
  }

  String t(BuildContext context) {
    return AppLocalizations.of(context)?.translate(this) ?? '';
  }
}
