import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/commons/widgets/back_button.dart';
import 'package:hnk_movie/src/core/commons/widgets/circle_button_appbar.dart';
import 'package:hnk_movie/src/core/commons/widgets/elevated_button.dart';
import 'package:hnk_movie/src/core/commons/widgets/text_form_field.dart';
import 'package:hnk_movie/src/core/constants/translation.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';
import 'package:hnk_movie/src/features/auth/domain/entities/sign_up.dart';
import 'package:hnk_movie/src/features/auth/presentation/providers/auth_controller.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/constants/size.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  late TextEditingController _repeatedPasswordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _repeatedPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.clear();
    _passwordController.clear();
    _nameController.clear();
    _repeatedPasswordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const BackCircleButton(),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              HCircleIcon(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    PhosphorIconsRegular.x,
                    size: 20,
                  )),
              gapW16,
            ],
          )
        ],
      ),
      body: _buildBackgroundImage(context),
    );
  }

  Column _buildTitleAndFormSignUp(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        gapH16,
        _buildFormSignUp(context),
        gapH100,
        _buildBottomText(context),
        gapH16,
      ],
    );
  }

  Widget _buildTitle() {
    return Text(HAppTranslation.signUp.t(context),
        style: HAppStyle.heading2Style);
  }

  _buildFormSignUp(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: hAppDefaultPaddingLR,
      child: Column(
        children: [
          HTextFormField(
            controller: _nameController,
            icon: const Icon(
              PhosphorIconsFill.user,
              size: 20,
              color: HAppColor.greyColor,
            ),
            hintText: HAppTranslation.name.t(context),
          ),
          gapH10,
          HTextFormField(
            controller: _emailController,
            icon: const Icon(
              PhosphorIconsFill.user,
              size: 20,
              color: HAppColor.greyColor,
            ),
            hintText: HAppTranslation.email.t(context),
          ),
          gapH10,
          HTextFormField(
            controller: _passwordController,
            icon: const Icon(
              PhosphorIconsFill.lockSimple,
              size: 20,
              color: HAppColor.greyColor,
            ),
            isPassword: true,
            hintText: HAppTranslation.password.t(context),
          ),
          gapH10,
          HTextFormField(
            controller: _repeatedPasswordController,
            icon: const Icon(
              PhosphorIconsFill.lockSimple,
              size: 20,
              color: HAppColor.greyColor,
            ),
            isPassword: true,
            hintText: HAppTranslation.repeatPassword.t(context),
          ),
          gapH24,
          Consumer(
            builder: (_, ref, __) {
              var state = ref.watch(authenticationControllerProvider);
              ref.listen(authenticationControllerProvider, (_, state) {
                if (state.isLoading) {
                } else if (state.hasValue) {
                  Navigator.pushNamed(context, '/process');
                }
              });
              return state.when(data: (data) {
                return SizedBox(
                  height: 50,
                  width: width,
                  child: HElevatedButton(
                      onPressed: () => ref
                          .read(authenticationControllerProvider.notifier)
                          .signUp(SignUp(
                              password: _passwordController.text.trim(),
                              email: _emailController.text.trim(),
                              name: _nameController.text.trim(),
                              repeatedPassword:
                                  _repeatedPasswordController.text.trim())),
                      child: Text(HAppTranslation.signUp.t(context))),
                );
              }, error: (e, st) {
                return SizedBox(
                  height: 50,
                  width: width,
                  child: HElevatedButton(
                      onPressed: () => ref
                          .read(authenticationControllerProvider.notifier)
                          .signUp(SignUp(
                              password: _passwordController.text.trim(),
                              email: _emailController.text.trim(),
                              name: _nameController.text.trim(),
                              repeatedPassword:
                                  _repeatedPasswordController.text.trim())),
                      child: Text(HAppTranslation.signUp.t(context))),
                );
              }, loading: () {
                return SizedBox(
                    height: 50,
                    width: width,
                    child: const HElevatedButton(
                      onPressed: null,
                      child: CircularProgressIndicator(
                        color: HAppColor.whileColor,
                      ),
                    ));
              });
            },
          )
        ],
      ),
    );
  }

  _buildBottomText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/login');
      },
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: HAppTranslation.alreadyHaveAnAccount.t(context),
                style: HAppStyle.paragraph2Regular),
            TextSpan(
                text: HAppTranslation.login.t(context),
                style: HAppStyle.label3Bold
                    .copyWith(color: HAppColor.bluePrimaryColor)),
          ],
        ),
      ),
    );
  }

  _buildBackgroundImage(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 190,
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
              child: _buildTitleAndFormSignUp(context),
            )
          ]),
        )
      ],
    );
  }
}
