import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/commons/widgets/circle_button_appbar.dart';
import 'package:hnk_movie/src/core/commons/widgets/elevated_button.dart';
import 'package:hnk_movie/src/core/commons/widgets/error_image.dart';
import 'package:hnk_movie/src/core/commons/widgets/load_image.dart';
import 'package:hnk_movie/src/core/constants/api.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/core/constants/translation.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/movie_local_controller_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CarouselSliderMovie extends StatelessWidget {
  const CarouselSliderMovie(
      {super.key, required this.movie, required this.onPressed});

  final Movie movie;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: HAppAPI.imageBaseUrl + (movie.backdropPath ?? ''),
      imageBuilder: (context, imageProvider) => Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: listColorsHome)),
              )),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: hAppDefaultPaddingLTRB,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/imdb_logo.png', height: 12),
                        gapW4,
                        Text(
                          (movie.voteAverage ?? 0).toString(),
                          style: HAppStyle.paragraph2Regular,
                        )
                      ],
                    ),
                    gapH12,
                    Text(
                      movie.title ?? '',
                      style: HAppStyle.heading3Style,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    gapH12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 50,
                            width: 200,
                            child: HElevatedButton(
                                radius: 30,
                                onPressed: onPressed,
                                child:
                                    Text(HAppTranslation.watchNow.t(context)))),
                        gapW16,
                        Consumer(
                          builder: (context, ref, child) {
                            final state =
                                ref.watch(movieLocalControllerProvider);
                            final isFavorited =
                                state.favoriteStatus[movie.id] ?? false;
                            return HCircleIcon(
                                onTap: () {
                                  ref
                                      .read(
                                          movieLocalControllerProvider.notifier)
                                      .toggleFavoriteMovie(movie, isFavorited);
                                },
                                icon: isFavorited
                                    ? const Icon(
                                        PhosphorIconsFill.bookmarkSimple,
                                        size: 20,
                                        color: HAppColor.bluePrimaryColor,
                                      )
                                    : const Icon(
                                        PhosphorIconsRegular.bookmarkSimple,
                                        size: 20,
                                      ));
                          },
                        ),
                      ],
                    ),
                  ]),
            ),
          )
        ],
      ),
      progressIndicatorBuilder: (context, url, progress) =>
          const LoadingImageWidget(),
      errorWidget: (context, url, error) => const ErrorImageWidget(),
    );
  }
}
