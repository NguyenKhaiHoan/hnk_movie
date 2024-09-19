import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/commons/widgets/network_image.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/core/constants/translation.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';
import 'package:hnk_movie/src/di/di.dart';
import 'package:hnk_movie/src/features/auth/presentation/providers/auth_controller.dart';
import 'package:hnk_movie/src/features/auth/presentation/widgets/section_account.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late Map<Widget, String> listSection;

  @override
  void initState() {
    listSection = {
      _buildIconSection(PhosphorIconsFill.user, const Color(0xff1403fd)):
          HAppTranslation.editProfile,
      _buildIconSection(PhosphorIconsFill.gear, const Color(0xffed9c02)):
          HAppTranslation.settings,
      _buildIconSection(PhosphorIconsFill.question, const Color(0xfffe0101)):
          HAppTranslation.helpCenter,
      _buildIconSection(PhosphorIconsFill.headset, const Color(0xff7f01ff)):
          HAppTranslation.contactBTVSupport,
      _buildIconSection(PhosphorIconsFill.info, const Color(0xff11d003)):
          HAppTranslation.aboutBTV,
    };
    super.initState();
  }

  Widget _buildIconSection(IconData icon, Color color) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: PhosphorIcon(
        icon,
        size: 20,
        color: HAppColor.whileColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: hAppDefaultPaddingLTRB,
        child: Column(
          children: [
            gapH40,
            Consumer(
              builder: (context, ref, child) {
                var state = ref.watch(authStateChangesProvider);
                return state.value != null
                    ? Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(1),
                            decoration: const BoxDecoration(
                                color: HAppColor.whileColor,
                                shape: BoxShape.circle),
                            child: ClipOval(
                              child: HNetworkImage(
                                url: state.value?.urlToImage ?? '',
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                          gapH12,
                          Text(
                            state.value?.email ?? '',
                            style: HAppStyle.heading5Style,
                          ),
                          gapH24,
                          SizedBox(
                            width: width,
                            height: 50,
                            child: Container(
                              padding: hAppDefaultPaddingLR,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: HAppColor.anotherColor, width: 1)),
                              child: Text(
                                'ID: ${state.value?.id ?? ''}',
                                style: HAppStyle.paragraph2Regular
                                    .copyWith(color: HAppColor.greyColor),
                              ),
                            ),
                          )
                        ],
                      )
                    : const SizedBox();
              },
            ),
            gapH24,
            Container(
              decoration: BoxDecoration(
                  color: HAppColor.anotherColor,
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 1) {
                          Navigator.pushNamed(context, '/setting');
                        }
                      },
                      child: SectionAccount(
                        icon: listSection.keys.elementAt(index),
                        title: listSection.values.elementAt(index).t(context),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(),
                  itemCount: listSection.length),
            ),
            gapH40,
            Consumer(
              builder: (context, ref, child) {
                return SizedBox(
                  width: width,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      logout(context, ref);
                    },
                    child: Text(
                      HAppTranslation.logOut.t(context),
                      style: HAppStyle.label2Bold
                          .copyWith(color: HAppColor.whileColor),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context, WidgetRef ref) async {
    await ref.read(authenticationControllerProvider.notifier).logout(ref);
    if (!context.mounted) return;
    ref.read(authRepositoryProvider).screenRedirect(context);
  }
}
