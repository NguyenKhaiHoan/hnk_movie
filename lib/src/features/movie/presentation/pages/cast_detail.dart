import 'package:contentsize_tabbarview/contentsize_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/core/commons/widgets/back_button.dart';
import 'package:hnk_movie/src/core/commons/widgets/blur_widget.dart';
import 'package:hnk_movie/src/core/commons/widgets/error_widget.dart';
import 'package:hnk_movie/src/core/commons/widgets/load_widget.dart';
import 'package:hnk_movie/src/core/commons/widgets/network_image.dart';
import 'package:hnk_movie/src/core/commons/widgets/sliver_app_bar_delegate.dart';
import 'package:hnk_movie/src/core/constants/api.dart';
import 'package:hnk_movie/src/core/constants/translation.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';
import 'package:hnk_movie/src/features/app/presentation/providers/language_provider.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/person_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/cast.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/detail_person_provider.dart';
import 'package:readmore/readmore.dart';

import '../../../../config/theme/style.dart';
import '../../../../core/constants/size.dart';

// ignore: must_be_immutable
class CastDetailPage extends StatefulWidget {
  const CastDetailPage({super.key, required this.cast});

  final Cast cast;

  @override
  State<CastDetailPage> createState() => _CastDetailPageState();
}

class _CastDetailPageState extends State<CastDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: _buildBody(context),
      ),
    );
  }

  _buildBody(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return CustomScrollView(
      slivers: <Widget>[
        SliverLayoutBuilder(
          builder: (BuildContext context, constraints) {
            final scrolled = constraints.scrollOffset > 260;
            return SliverAppBar(
              expandedHeight: height * 0.6,
              collapsedHeight: kToolbarHeight,
              toolbarHeight: kToolbarHeight,
              pinned: true,
              title: scrolled
                  ? Text(
                      widget.cast.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  : const SizedBox(),
              backgroundColor: scrolled
                  ? const Color.fromRGBO(9, 14, 23, 1)
                  : Colors.transparent,
              leading: const BackCircleButton(),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: BottomAppBarDetailCast(
                  cast: widget.cast,
                ),
              ),
            );
          },
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: HSliverAppBarDelegate(
              minHeight: 60,
              maxHeight: 60,
              child: TabBar(
                labelColor: HAppColor.bluePrimaryColor,
                unselectedLabelColor: HAppColor.greyColor,
                controller: _tabController,
                indicatorColor: HAppColor.bluePrimaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.all(10),
                indicatorWeight: 2,
                tabs: const [
                  Tab(
                    text: 'Filmography',
                  ),
                  Tab(text: 'Biography')
                ],
              )),
        ),
        SliverToBoxAdapter(
          child: ContentSizeTabBarView(controller: _tabController, children: [
            FilmographyTabView(
              personId: widget.cast.id!,
            ),
            BiographyTabView(
              personId: widget.cast.id!,
            )
          ]),
        )
      ],
    );
  }
}

class BottomAppBarDetailCast extends StatelessWidget {
  const BottomAppBarDetailCast({super.key, required this.cast});

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image:
                  NetworkImage(HAppAPI.imageBaseUrl + (cast.profilePath ?? '')),
              fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
          HAppColor.otherColor,
          HAppColor.otherColor.withOpacity(.3)
        ])),
        child: Padding(
          padding: hAppDefaultPaddingLTRB,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                cast.name ?? '',
                style: HAppStyle.heading3Style,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                cast.knownForDepartment ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: HAppStyle.paragraph2Regular
                    .copyWith(color: HAppColor.greyColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FilmographyTabView extends StatelessWidget {
  const FilmographyTabView({super.key, required this.personId});

  final int personId;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var movies = ref.watch(fetchMovieCreditsPersonProvider(PersonRequest(
            personId: personId,
            language:
                ref.watch(languageControllerProvider).locale.languageCode ==
                        'en'
                    ? 'en-US'
                    : 'vi-VN')));
        return movies.when(
            data: (data) {
              return GridView.builder(
                padding: hAppDefaultPaddingLTRB,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 3 / 4),
                itemBuilder: (_, index) {
                  var movie = data[index];
                  return GestureDetector(
                    onTap: () {
                      // AppRoutes.onMoviePressed(context, movie);
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: HNetworkImage(
                            url:
                                HAppAPI.imageBaseUrl + (movie.posterPath ?? ''),
                            height: 200,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            child: BlurWidget(
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
                        )
                      ],
                    ),
                  );
                },
                itemCount: data.length,
              );
            },
            error: (error, stackTrace) => ErrorWidgetItem(
                  error: error.toString(),
                ),
            loading: () => const LoadingWidgetItem(height: 200));
      },
    );
  }
}

class BiographyTabView extends StatelessWidget {
  const BiographyTabView({super.key, required this.personId});

  final int personId;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var fetchDetailPerson = ref.watch(fetchDetailPersonProvider(
            PersonRequest(
                personId: personId,
                language:
                    ref.watch(languageControllerProvider).locale.languageCode ==
                            'en'
                        ? 'en-US'
                        : 'vi-VN')));
        return fetchDetailPerson.when(
            data: (data) {
              return Column(
                children: [
                  Padding(
                    padding: hAppDefaultPaddingLTR,
                    child: ReadMoreText(
                      data.biography,
                      style: HAppStyle.paragraph2Regular
                          .copyWith(color: HAppColor.greyColor),
                      trimMode: TrimMode.Line,
                      trimLines: 8,
                      colorClickableText: HAppColor.bluePrimaryColor,
                      trimCollapsedText: ' More',
                      trimExpandedText: ' Less',
                      moreStyle: HAppStyle.paragraph2Regular
                          .copyWith(color: HAppColor.bluePrimaryColor),
                    ),
                  ),
                  ImagesPerson(personId: personId)
                ],
              );
            },
            error: (error, stackTrace) => const ErrorWidgetItem(),
            loading: () => const LoadingWidgetItem(height: 250));
      },
    );
  }
}

class ImagesPerson extends StatelessWidget {
  const ImagesPerson({super.key, required this.personId});

  final int personId;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final imagePersonAsyncValue =
          ref.watch(fetchImagesPersonProvider(personId));
      return imagePersonAsyncValue.when(data: (data) {
        return Padding(
          padding: hAppDefaultPaddingLTRB,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                HAppTranslation.photos.t(context),
                style: HAppStyle.heading5Style.copyWith(fontSize: 16),
              ),
              gapH12,
              SizedBox(
                height: 250,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var image = data[index];
                      return GestureDetector(
                        onTap: null,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: HNetworkImage(
                            url: HAppAPI.imageBaseUrl + (image.filePath),
                            height: 250,
                            width: 150,
                          ),
                        ),
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
        return const LoadingWidgetItem(height: 270);
      });
    });
  }
}
