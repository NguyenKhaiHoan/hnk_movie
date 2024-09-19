import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/di/di.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(Duration.zero).then((_) {
      ref.read(authRepositoryProvider).screenRedirect(context);
    });
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: HAppColor.bluePrimaryColor,
        ),
      ),
    );
  }
}
