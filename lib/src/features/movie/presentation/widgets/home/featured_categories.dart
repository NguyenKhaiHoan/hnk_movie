import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/genre_provider.dart';
import 'package:hnk_movie/src/features/movie/presentation/widgets/home/feature_categories_item.dart';

class FeaturedCategories extends ConsumerWidget {
  const FeaturedCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var genres = ref.watch(genreProvider);
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: hAppDefaultPaddingLR,
      child: Column(
        children: [
          Row(
            children: [
              FeaturedCategoriesItem(
                  height: 208,
                  width: (size.width -
                          hAppDefaultPadding * 2 -
                          hAppDefaultPadding / 2) /
                      2,
                  genre: genres[0]),
              gapW8,
              Column(
                children: [
                  FeaturedCategoriesItem(
                      height: 100,
                      width: (size.width -
                              hAppDefaultPadding * 2 -
                              hAppDefaultPadding / 2) /
                          2,
                      genre: genres[1]),
                  gapH8,
                  FeaturedCategoriesItem(
                      height: 100,
                      width: (size.width -
                              hAppDefaultPadding * 2 -
                              hAppDefaultPadding / 2) /
                          2,
                      genre: genres[2])
                ],
              )
            ],
          ),
          gapH8,
          Row(
            children: [
              FeaturedCategoriesItem(
                  height: 100,
                  width: (size.width -
                          hAppDefaultPadding * 2 -
                          hAppDefaultPadding / 2) /
                      2,
                  genre: genres[3]),
              gapW8,
              FeaturedCategoriesItem(
                  height: 100,
                  width: (size.width -
                          hAppDefaultPadding * 2 -
                          hAppDefaultPadding / 2) /
                      2,
                  genre: genres[4]),
            ],
          )
        ],
      ),
    );
  }
}
