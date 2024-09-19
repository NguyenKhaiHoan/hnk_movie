import 'package:flutter/material.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/commons/widgets/network_image.dart';
import 'package:hnk_movie/src/core/commons/widgets/process_bar.dart';
import 'package:hnk_movie/src/core/constants/api.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';

class IsWatchingMovieItemInHome extends StatelessWidget {
  const IsWatchingMovieItemInHome({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 150,
          width: 200,
          child: Stack(
            children: [
              HNetworkImage(
                url: HAppAPI.imageBaseUrl + (movie.posterPath ?? ''),
                height: 150,
                width: 200,
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: HProgressBar(
                  height: 5,
                  width: 200,
                  progress: 0.3,
                ),
              )
            ],
          ),
        ),
        gapH12,
        Text(
          (movie.title ?? '').intelliTrim(),
          style: HAppStyle.paragraph2Regular,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
