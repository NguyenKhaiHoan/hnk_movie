import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/commons/widgets/elevated_button.dart';
import 'package:hnk_movie/src/core/commons/widgets/social_button_auth.dart';
import 'package:hnk_movie/src/core/constants/translation.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';
import 'package:hnk_movie/src/features/auth/presentation/providers/auth_controller.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/constants/size.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBackgroundImage(context),
    );
  }

  Column _buildAllButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[gapH16, _buildButtons(context), gapH16],
    );
  }

  Widget _buildTitle() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: 'Start Streaming Now\n',
              style: HAppStyle.heading2Style
                  .copyWith(color: const Color.fromARGB(255, 200, 200, 200))),
          TextSpan(
              text: 'with',
              style: HAppStyle.heading2Style
                  .copyWith(color: const Color.fromARGB(255, 200, 200, 200))),
          TextSpan(
              text: ' BlackTV',
              style: HAppStyle.heading1Style
                  .copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  _buildButtons(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: hAppDefaultPaddingLR,
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: 50,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                HAppTranslation.login.t(context),
                style:
                    HAppStyle.label2Bold.copyWith(color: HAppColor.whileColor),
              ),
            ),
          ),
          gapH10,
          Consumer(builder: (_, ref, __) {
            var state = ref.watch(authenticationControllerProvider);
            ref.listen(authenticationControllerProvider, (_, state) {
              if (state.isLoading) {
              } else if (state.hasValue) {
                Navigator.pushNamed(context, '/process');
              }
            });
            return state.when(
                data: (data) {
                  return HSocialButtonAuth(
                    width: width,
                    title: HAppTranslation.loginViaGoogle.t(context),
                    icon: PhosphorIconsFill.googleLogo,
                    onPress: () => ref
                        .read(authenticationControllerProvider.notifier)
                        .signInWithGoogle(),
                  );
                },
                error: (e, st) {
                  return HSocialButtonAuth(
                    width: width,
                    title: HAppTranslation.loginViaGoogle.t(context),
                    icon: PhosphorIconsFill.googleLogo,
                    onPress: () => ref
                        .read(authenticationControllerProvider.notifier)
                        .signInWithGoogle(),
                  );
                },
                loading: () => HSocialButtonAuth(
                      isLoading: true,
                      width: width,
                      title: HAppTranslation.loginViaGoogle.t(context),
                      icon: PhosphorIconsFill.googleLogo,
                      onPress: null,
                    ));
          }),
          gapH10,
          HSocialButtonAuth(
            width: width,
            title: HAppTranslation.loginViaFacebook.t(context),
            icon: PhosphorIconsFill.facebookLogo,
          ),
          gapH10,
          SizedBox(
            width: width,
            height: 50,
            child: HElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-up');
                },
                child: Text(
                  HAppTranslation.signUp.t(context),
                )),
          ),
        ],
      ),
    );
  }

  _buildBackgroundImage(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 500,
          backgroundColor: HAppColor.otherColor,
          leading: const SizedBox(),
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_welcome.jpg'),
                      fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                      HAppColor.otherColor,
                      HAppColor.otherColor.withOpacity(.3)
                    ])),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: hAppDefaultPaddingLTRB,
                    child: _buildTitle(),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: hAppDefaultPaddingLTRB,
              child: _buildAllButton(context),
            )
          ]),
        )
      ],
    );
  }
}
