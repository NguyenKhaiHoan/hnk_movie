import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/routes/routes.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/core/constants/translation.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/list_movie_provider.dart';
import 'package:hnk_movie/src/features/movie/presentation/widgets/movie_item.dart';

// ignore: must_be_immutable
class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  var listSection = [HAppTranslation.download, HAppTranslation.favoriteMovies];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: hAppDefaultPaddingLTRB,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 1) {
                      Navigator.pushNamed(context, '/favorite-movie');
                    }
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Text(
                      listSection[index].t(context),
                      style: HAppStyle.heading5Style.copyWith(fontSize: 16),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: HAppColor.greyColor,
                );
              },
              itemCount: listSection.length),
          gapH24,
          Text(
            HAppTranslation.historyWatch.t(context),
            style: HAppStyle.label2Regular,
          ),
          gapH12,
          Text(
            HAppTranslation.historyDescription.t(context),
            style: HAppStyle.paragraph2Regular
                .copyWith(color: HAppColor.greyColor),
          ),
          gapH12,
          Consumer(builder: (_, ref, __) {
            var state = ref.watch(historyMovieProvider);
            return state.movies.isNotEmpty
                ? SizedBox(
                    height: 250,
                    child: ListView.separated(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var movie = state.movies[index];
                          return GestureDetector(
                            onTap: () =>
                                AppRoutes.onMoviePressed(context, movie),
                            child: MovieVerticalItem(movie: movie),
                          );
                        },
                        separatorBuilder: (context, index) => gapW8,
                        itemCount: state.movies.length < 10
                            ? state.movies.length
                            : 10),
                  )
                : const SizedBox();
          })
        ],
      ),
    ));
  }
}
