import 'package:flutter/material.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/commons/widgets/network_image.dart';
import 'package:hnk_movie/src/core/constants/api.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/search_person_response.dart';

class PersonResultVerticalItem extends StatelessWidget {
  const PersonResultVerticalItem({
    super.key,
    required this.person,
  });

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: HNetworkImage(
            url: HAppAPI.imageBaseUrl + (person.profilePath ?? ''),
            height: 250,
            width: 150,
          ),
        ),
        gapH12,
        Text(
          person.name ?? '',
          style: HAppStyle.label2Bold,
        ),
        gapH6,
        Text(person.knownForDepartment ?? '',
            style: HAppStyle.paragraph2Regular
                .copyWith(color: HAppColor.greyColor))
      ],
    );
  }
}
