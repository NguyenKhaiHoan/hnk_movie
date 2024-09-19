import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/routes/routes.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/commons/widgets/back_button.dart';
import 'package:hnk_movie/src/core/commons/widgets/circle_button_appbar.dart';
import 'package:hnk_movie/src/core/commons/widgets/network_image.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/core/constants/translation.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/list_movie_provider.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/movie_local_controller_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/constants/api.dart';

class FavoriteMovie extends ConsumerWidget {
  const FavoriteMovie({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(Duration.zero).then((_) {
      ref.read(movieLocalControllerProvider.notifier).loadFavoriteMovies();
    });
    return Scaffold(
      appBar: AppBar(
        leading: const BackCircleButton(),
        title: Text(HAppTranslation.favoriteMovies.t(context)),
        toolbarHeight: kToolbarHeight,
      ),
      body: SingleChildScrollView(
        child: Consumer(
          builder: (context, ref, child) {
            var state = ref.watch(movieLocalControllerProvider);
            return state.movies.isNotEmpty
                ? GridView.builder(
                    padding: hAppDefaultPaddingLTRB,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 3 / 4),
                    itemBuilder: (_, index) {
                      var movie = state.movies[index];
                      return GestureDetector(
                        onTap: () {
                          ref
                              .read(historyMovieProvider.notifier)
                              .addMovieToHistory(movie);
                          AppRoutes.onMoviePressed(context, movie);
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: HNetworkImage(
                                url: HAppAPI.imageBaseUrl +
                                    (movie.posterPath ?? ''),
                                height: 300,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset('assets/images/imdb_logo.png',
                                          height: 12),
                                      gapW4,
                                      Text(
                                        movie.voteAverage.toString(),
                                        style: HAppStyle.paragraph2Regular,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                child: Consumer(
                                  builder: (context, ref, child) {
                                    final state =
                                        ref.watch(movieLocalControllerProvider);
                                    final isFavorited =
                                        state.favoriteStatus[movie.id] ?? false;
                                    return HCircleIcon(
                                        onTap: () {
                                          ref
                                              .read(movieLocalControllerProvider
                                                  .notifier)
                                              .toggleFavoriteMovie(
                                                  movie, isFavorited);
                                        },
                                        icon: isFavorited
                                            ? const Icon(
                                                PhosphorIconsFill
                                                    .bookmarkSimple,
                                                size: 20,
                                                color:
                                                    HAppColor.bluePrimaryColor,
                                              )
                                            : const Icon(
                                                PhosphorIconsRegular
                                                    .bookmarkSimple,
                                                size: 20,
                                              ));
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: state.movies.length,
                  )
                : const SizedBox();
          },
        ),
      ),
    );
  }
}
