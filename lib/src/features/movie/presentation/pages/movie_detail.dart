import 'package:contentsize_tabbarview/contentsize_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/core/commons/widgets/back_button.dart';
import 'package:hnk_movie/src/core/commons/widgets/circle_button_appbar.dart';
import 'package:hnk_movie/src/core/commons/widgets/sliver_app_bar_delegate.dart';
import 'package:hnk_movie/src/core/constants/translation.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/movie_local_controller_provider.dart';
import 'package:hnk_movie/src/features/movie/presentation/widgets/detail/about_movie_tab.dart';
import 'package:hnk_movie/src/features/movie/presentation/widgets/detail/bottom_app_bar_detail_movie.dart';
import 'package:hnk_movie/src/features/movie/presentation/widgets/detail/more_like_this_tab.dart';
import 'package:hnk_movie/src/features/movie/presentation/widgets/detail/trailer_movie_tab.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/style.dart';
import '../../../../core/commons/widgets/elevated_button.dart';
import '../../../../core/constants/size.dart';

// ignore: must_be_immutable
class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key, required this.movie});

  final Movie movie;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
                      widget.movie.title ?? '',
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
                background: BottomAppBarDetailMovie(
                  movie: widget.movie,
                ),
              ),
            );
          },
        ),
        SliverToBoxAdapter(
          child: TitleDetailMovie(movie: widget.movie),
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
                indicatorWeight: 3,
                tabs: const [
                  Tab(
                    text: 'Trailers',
                  ),
                  Tab(text: 'More Like This'),
                  Tab(text: 'About')
                ],
              )),
        ),
        SliverToBoxAdapter(
          child: ContentSizeTabBarView(controller: _tabController, children: [
            TrailerTabView(movie: widget.movie),
            MoreLikeThisTabView(movie: widget.movie),
            AboutMovieTabView(movie: widget.movie),
          ]),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class TitleDetailMovie extends StatelessWidget {
  const TitleDetailMovie({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: hAppDefaultPaddingLTRB,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: 50,
                  width: 200,
                  child: HElevatedButton(
                      radius: 30,
                      onPressed: () {},
                      child: Text(HAppTranslation.watchNow.t(context)))),
              HCircleIcon(
                  onTap: () {},
                  icon: const Icon(
                    PhosphorIconsRegular.downloadSimple,
                    size: 20,
                  )),
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(movieLocalControllerProvider);
                  final isFavorited = state.favoriteStatus[movie.id] ?? false;
                  return HCircleIcon(
                      onTap: () {
                        ref
                            .read(movieLocalControllerProvider.notifier)
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
              HCircleIcon(
                  onTap: () {},
                  icon: const Icon(PhosphorIconsRegular.shareFat, size: 20))
            ],
          ),
          gapH24,
          Text(
              "${movie.originalLanguage == 'en' ? 'English' : movie.originalLanguage} • ${movie.releaseDate}",
              style: HAppStyle.paragraph1Regular),
          gapH12,
          Text(
            movie.overview ?? '',
            style: HAppStyle.paragraph1Regular
                .copyWith(color: HAppColor.greyColor),
          )
        ],
      ),
    );
  }
}
