import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/routes/routes.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/commons/widgets/back_button.dart';
import 'package:hnk_movie/src/core/commons/widgets/network_image.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/list_movie_provider.dart';

import '../../../../core/constants/api.dart';

class SeeAllMovie extends StatelessWidget {
  const SeeAllMovie({super.key, required this.movies, required this.title});

  final List<Movie> movies;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackCircleButton(),
        title: Text(title),
        toolbarHeight: kToolbarHeight,
      ),
      body: SingleChildScrollView(
        child: Consumer(
          builder: (context, ref, child) {
            return GridView.builder(
              padding: hAppDefaultPaddingLTRB,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 3 / 4),
              itemBuilder: (_, index) {
                var movie = movies[index];
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
                          url: HAppAPI.imageBaseUrl + (movie.posterPath ?? ''),
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
                      )
                    ],
                  ),
                );
              },
              itemCount: movies.length,
            );
          },
        ),
      ),
    );
  }
}
