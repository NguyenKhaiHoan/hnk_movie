import 'package:flutter/material.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/commons/widgets/blur_widget.dart';
import 'package:hnk_movie/src/core/commons/widgets/network_image.dart';
import 'package:hnk_movie/src/core/constants/api.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/core/constants/translation.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';

class NowPlayingMovieItemInHome extends StatelessWidget {
  const NowPlayingMovieItemInHome({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: HNetworkImage(
              url: HAppAPI.imageBaseUrl + (movie.backdropPath ?? ''),
              height: 150,
              width: 200,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                margin: const EdgeInsets.all(5),
                child: BlurWidget(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                              color: HAppColor.redColor,
                              shape: BoxShape.circle),
                        ),
                        gapW4,
                        Text(
                          HAppTranslation.now.t(context),
                          style: HAppStyle.paragraph3Regular,
                        )
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),
      gapH12,
      Text(
        (movie.title ?? '').intelliTrim(),
        style: HAppStyle.paragraph2Regular,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      )
    ]);
  }
}
