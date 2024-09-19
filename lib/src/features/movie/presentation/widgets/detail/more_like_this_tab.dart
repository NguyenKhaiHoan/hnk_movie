import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/routes/routes.dart';
import 'package:hnk_movie/src/core/commons/widgets/error_widget.dart';
import 'package:hnk_movie/src/core/commons/widgets/load_widget.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/detail_movie_provider.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/list_movie_provider.dart';
import 'package:hnk_movie/src/features/movie/presentation/widgets/movie_item.dart';

class MoreLikeThisTabView extends StatelessWidget {
  const MoreLikeThisTabView({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final similarMovieProvider = fetchListSimilarMovieProvider(movie.id!);
      final similarMovieAsyncValue = ref.watch(similarMovieProvider);
      return similarMovieAsyncValue.when(data: (List<Movie> data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: ListView.separated(
                  padding: hAppDefaultPaddingLTRB,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var movie = data[index];
                    return GestureDetector(
                      onTap: () {
                        ref
                            .read(historyMovieProvider.notifier)
                            .addMovieToHistory(movie);
                        AppRoutes.onMoviePressed(context, movie);
                      },
                      child: MovieVerticalItem(movie: movie),
                    );
                  },
                  separatorBuilder: (context, index) => gapW8,
                  itemCount: 5),
            )
          ],
        );
      }, error: (Object error, StackTrace stackTrace) {
        return const ErrorWidgetItem();
      }, loading: () {
        return const LoadingWidgetItem(height: 250);
      });
    });
  }
}
