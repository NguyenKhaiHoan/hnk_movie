import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/commons/widgets/back_button.dart';
import 'package:hnk_movie/src/core/constants/language.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/core/constants/translation.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';
import 'package:hnk_movie/src/features/app/presentation/providers/language_provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late List<String> listSection;
  bool isEnabledParental = false;
  bool isEnabledDownload = false;
  bool isEnabledAutoPlay = false;

  @override
  void initState() {
    listSection = [
      HAppTranslation.reChooseInterest,
      HAppTranslation.language,
      HAppTranslation.parentalControl,
      HAppTranslation.downloadOnlyViaWifi,
      HAppTranslation.autoPlay,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackCircleButton(),
        title: Text(HAppTranslation.settings.t(context)),
      ),
      body: Padding(
        padding: hAppDefaultPaddingLTRB,
        child: Container(
          decoration: BoxDecoration(
              color: HAppColor.anotherColor,
              borderRadius: BorderRadius.circular(10)),
          child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: hAppDefaultPaddingLR,
              itemBuilder: (context, index) {
                late Widget trailing;
                switch (index) {
                  case 0:
                    trailing = IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: HAppColor.greyColor,
                        ));
                    break;
                  case 1:
                    trailing = Consumer(
                      builder: (context, ref, child) {
                        var state = ref.watch(languageControllerProvider);
                        return DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            iconStyleData: const IconStyleData(
                                iconDisabledColor: HAppColor.greyColor,
                                iconEnabledColor: HAppColor.whileColor),
                            hint: Text(
                              state.locale.languageCode == 'en'
                                  ? "English"
                                  : "Tiếng Việt",
                              style: HAppStyle.paragraph2Regular
                                  .copyWith(color: HAppColor.whileColor),
                            ),
                            items: HAppLanguage.languages
                                .map((item) => DropdownMenuItem<String>(
                                      value: item.value,
                                      child: Text(
                                        item.value,
                                        style: HAppStyle.paragraph2Regular
                                            .copyWith(
                                                color: HAppColor.greyColor),
                                      ),
                                    ))
                                .toList(),
                            value: state.locale.languageCode == 'en'
                                ? "English"
                                : "Tiếng Việt",
                            onChanged: (String? value) {
                              setState(() {
                                ref
                                    .read(languageControllerProvider.notifier)
                                    .onLocaleChanged(
                                        value == 'English' ? 'en' : 'vi');
                                SchedulerBinding.instance
                                    .addPostFrameCallback((_) async {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/base', (Route<dynamic> route) => false);
                                });
                              });
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              height: 30,
                              width: 120,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                            ),
                          ),
                        );
                      },
                    );
                    break;
                  case 2:
                    trailing = Switch(
                      activeColor: HAppColor.whileColor,
                      activeTrackColor: HAppColor.bluePrimaryColor,
                      inactiveThumbColor: HAppColor.whileColor,
                      inactiveTrackColor: Colors.grey.shade400,
                      splashRadius: 50.0,
                      value: isEnabledParental,
                      onChanged: (value) => setState(() {
                        isEnabledParental = value;
                      }),
                    );
                    break;
                  case 3:
                    trailing = Switch(
                      activeColor: HAppColor.whileColor,
                      activeTrackColor: HAppColor.bluePrimaryColor,
                      inactiveThumbColor: HAppColor.whileColor,
                      inactiveTrackColor: Colors.grey.shade400,
                      splashRadius: 50.0,
                      value: isEnabledDownload,
                      onChanged: (value) => setState(() {
                        isEnabledDownload = value;
                      }),
                    );
                    break;
                  case 4:
                    trailing = Switch(
                      activeColor: HAppColor.whileColor,
                      activeTrackColor: HAppColor.bluePrimaryColor,
                      inactiveThumbColor: HAppColor.whileColor,
                      inactiveTrackColor: Colors.grey.shade400,
                      splashRadius: 50.0,
                      value: isEnabledAutoPlay,
                      onChanged: (value) => setState(() {
                        isEnabledAutoPlay = value;
                      }),
                    );
                    break;
                }
                return SectionSetting(
                  title: listSection.elementAt(index).t(context),
                  trailing: trailing,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(),
              itemCount: listSection.length),
        ),
      ),
    );
  }
}

class SectionSetting extends StatelessWidget {
  const SectionSetting(
      {super.key, required this.trailing, required this.title});

  final Widget trailing;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: HAppStyle.paragraph2Regular,
      ),
      trailing: trailing,
    );
  }
}
