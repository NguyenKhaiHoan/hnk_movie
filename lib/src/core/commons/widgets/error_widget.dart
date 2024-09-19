import 'package:flutter/material.dart';

class ErrorWidgetItem extends StatelessWidget {
  const ErrorWidgetItem({
    super.key,
    this.error,
  });

  final String? error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error ?? 'Error, nothing to display :((('),
    );
  }
}
