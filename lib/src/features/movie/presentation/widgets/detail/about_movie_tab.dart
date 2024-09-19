import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/routes/routes.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/commons/widgets/error_widget.dart';
import 'package:hnk_movie/src/core/commons/widgets/load_widget.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/core/constants/translation.dart';
import 'package:hnk_movie/src/core/extensions/int.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';
import 'package:hnk_movie/src/features/app/presentation/providers/language_provider.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/movie_detail_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie_detail.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/detail_movie_provider.dart';
import 'package:hnk_movie/src/features/movie/presentation/widgets/cast_item.dart';

// ignore: must_be_immutable
class AboutMovieTabView extends StatelessWidget {
  const AboutMovieTabView({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final movieDetailRequest = MovieSimpleRequest(
          movieId: movie.id!,
          language:
              ref.watch(languageControllerProvider).locale.languageCode == 'en'
                  ? 'en-US'
                  : 'vi-VN');
      final detailMovieProvider = fetchDetailMovieProvider(movieDetailRequest);
      final detailMovieAsyncValue = ref.watch(detailMovieProvider);
      return detailMovieAsyncValue.when(data: (data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GeneralInfomationAboutItem(
              movie: data,
            ),
            CastsAbout(movieId: data.id)
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

// ignore: must_be_immutable
class GeneralInfomationAboutItem extends StatelessWidget {
  GeneralInfomationAboutItem({super.key, required this.movie});

  final MovieDetail movie;

  List<String> infomationMovieTitle = [
    HAppTranslation.spokenLanguages,
    HAppTranslation.runtime,
    HAppTranslation.productionCountries,
    HAppTranslation.productionCompanies,
  ];
  Widget _buildLayout({
    required BuildContext context,
    required String title,
    required String subtitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title.t(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: HAppStyle.heading5Style.copyWith(fontSize: 16),
        ),
        gapH4,
        Text(
          subtitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:
              HAppStyle.paragraph1Regular.copyWith(color: HAppColor.greyColor),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: hAppDefaultPaddingLTRB,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: hAppDefaultPadding / 2,
        mainAxisSpacing: hAppDefaultPadding / 2,
        childAspectRatio: 2.5,
      ),
      itemCount: infomationMovieTitle.length,
      itemBuilder: (context, index) {
        var subtitle = '';
        switch (index) {
          case 0:
            subtitle = movie.spokenLanguages
                .map((language) => language.name)
                .join(', ');
            break;
          case 1:
            subtitle = movie.runtime.toHoursMinutes();
            break;
          case 2:
            subtitle = movie.productionCountries
                .map((country) => country.name)
                .join(', ');
            break;
          case 3:
            subtitle = movie.productionCompanies
                .map((company) => company.name)
                .join(', ');
            break;
        }
        return _buildLayout(
            context: context,
            title: infomationMovieTitle[index],
            subtitle: subtitle);
      },
    );
  }
}

class CastsAbout extends StatelessWidget {
  const CastsAbout({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final movieRequest = MovieSimpleRequest(
          movieId: movieId,
          language:
              ref.watch(languageControllerProvider).locale.languageCode == 'en'
                  ? 'en-US'
                  : 'vi-VN');
      final castsMovieProvider = fetchListCastMovieProvider(movieRequest);
      final castsMovieAsyncValue = ref.watch(castsMovieProvider);
      return castsMovieAsyncValue.when(data: (data) {
        return Padding(
          padding: hAppDefaultPaddingLTRB,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                HAppTranslation.casts.t(context),
                style: HAppStyle.heading5Style.copyWith(fontSize: 16),
              ),
              gapH12,
              SizedBox(
                height: 310,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var cast = data[index];
                      return GestureDetector(
                        onTap: () => AppRoutes.onCastPressed(context, cast),
                        child: CastVerticalItem(cast: cast),
                      );
                    },
                    separatorBuilder: (context, index) => gapW8,
                    itemCount: 5),
              )
            ],
          ),
        );
      }, error: (Object error, StackTrace stackTrace) {
        return const ErrorWidgetItem();
      }, loading: () {
        return const LoadingWidgetItem(height: 330);
      });
    });
  }
}
