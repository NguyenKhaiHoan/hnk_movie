import 'package:flutter/material.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/commons/widgets/network_image.dart';
import 'package:hnk_movie/src/core/constants/api.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/cast.dart';

class CastVerticalItem extends StatelessWidget {
  const CastVerticalItem({
    super.key,
    required this.cast,
  });

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: HNetworkImage(
            url: HAppAPI.imageBaseUrl + (cast.profilePath ?? ''),
            height: 250,
            width: 150,
          ),
        ),
        gapH12,
        Text(
          cast.name!.intelliTrim(),
          style: HAppStyle.label2Bold,
        ),
        gapH6,
        Text(cast.knownForDepartment!,
            style: HAppStyle.paragraph2Regular
                .copyWith(color: HAppColor.greyColor))
      ],
    );
  }
}
