import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/routes/routes.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/core/commons/widgets/error_widget.dart';
import 'package:hnk_movie/src/core/commons/widgets/load_widget.dart';
import 'package:hnk_movie/src/core/commons/widgets/section_title.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/core/constants/translation.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/list_movie_provider.dart';
import 'package:hnk_movie/src/features/movie/presentation/widgets/home/carousel_slider_movie.dart';
import 'package:hnk_movie/src/features/movie/presentation/widgets/home/featured_categories.dart';
import 'package:hnk_movie/src/features/movie/presentation/widgets/home/is_watching_movie.dart';
import 'package:hnk_movie/src/features/movie/presentation/widgets/home/now_playing_movie.dart';
import 'package:hnk_movie/src/features/movie/presentation/widgets/home/small_slider_item.dart';
import 'package:hnk_movie/src/features/movie/presentation/widgets/movie_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;

  late CarouselController _carouselController;
  late ScrollController _scrollSilderController;

  @override
  void initState() {
    _carouselController = CarouselController();
    _scrollSilderController = ScrollController();
    super.initState();
  }

  var buildCount = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Consumer(builder: (context, ref, _) {
            final upcomingMovieProvider = fetchListUpcomingMovieProvider(null);
            final upcomingMovieAsyncValue = ref.watch(upcomingMovieProvider);
            return upcomingMovieAsyncValue.when(data: (List<Movie> data) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildCarouselSlider(height, data, width),
                  gapH6,
                  _buildSmallListSlider(data, activeIndex),
                  gapH16,
                  _buildIndicator()
                ],
              );
            }, error: (Object error, StackTrace stackTrace) {
              return ErrorWidgetItem(
                error: error.toString(),
              );
            }, loading: () {
              return LoadingWidgetItem(
                height: height * 0.6,
              );
            });
          }),
          gapH24,
          Consumer(builder: (context, ref, _) {
            final topRatedMovieProvider = fetchListTopRatedMovieProvider(null);
            final topRatedMovieAsyncValue = ref.watch(topRatedMovieProvider);
            return topRatedMovieAsyncValue.when(data: (List<Movie> data) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(
                      title: HAppTranslation.forYou.t(context),
                      onPressed: () => AppRoutes.onSeeAllPressed(
                          context: context,
                          movies: data,
                          title: HAppTranslation.forYou.t(context))),
                  gapH12,
                  SizedBox(
                    height: 250,
                    child: ListView.separated(
                        padding: hAppDefaultPaddingLR,
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
              return ErrorWidgetItem(
                error: error.toString(),
              );
            }, loading: () {
              return const LoadingWidgetItem(
                height: 250,
              );
            });
          }),
          gapH24,
          Consumer(builder: (context, ref, _) {
            final isWatchingMovieProvider =
                fetchListIsWatchingMovieProvider(null);
            final isWatchingMovieAsyncValue =
                ref.watch(isWatchingMovieProvider);
            return isWatchingMovieAsyncValue.when(data: (List<Movie> data) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(
                      title: HAppTranslation.continueWatching.t(context),
                      onPressed: null),
                  gapH12,
                  SizedBox(
                    height: 180,
                    child: ListView.separated(
                        padding: hAppDefaultPaddingLR,
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
                            child: IsWatchingMovieItemInHome(
                              movie: movie,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => gapW8,
                        itemCount: 2),
                  )
                ],
              );
            }, error: (Object error, StackTrace stackTrace) {
              return ErrorWidgetItem(
                error: error.toString(),
              );
            }, loading: () {
              return const SizedBox(
                height: 250,
                child: Center(
                  child: CircularProgressIndicator(
                    color: HAppColor.bluePrimaryColor,
                  ),
                ),
              );
            });
          }),
          gapH24,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(
                  title: HAppTranslation.featuredCategories.t(context),
                  onPressed: () {},
                  seeAll: false),
              gapH12,
              const FeaturedCategories()
            ],
          ),
          gapH24,
          Consumer(builder: (context, ref, _) {
            final nowPlayingMovieProvider =
                fetchListNowPlayingMovieProvider(null);
            final nowPlayingMovieAsyncValue =
                ref.watch(nowPlayingMovieProvider);
            return nowPlayingMovieAsyncValue.when(data: (List<Movie> data) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(
                      title: HAppTranslation.nowPlaying.t(context),
                      onPressed: () => AppRoutes.onSeeAllPressed(
                          context: context,
                          movies: data,
                          title: HAppTranslation.nowPlaying.t(context))),
                  gapH12,
                  SizedBox(
                    height: 180,
                    child: ListView.separated(
                        padding: hAppDefaultPaddingLR,
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
                            child: NowPlayingMovieItemInHome(
                              movie: movie,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => gapW8,
                        itemCount: 5),
                  )
                ],
              );
            }, error: (Object error, StackTrace stackTrace) {
              return ErrorWidgetItem(
                error: error.toString(),
              );
            }, loading: () {
              return const LoadingWidgetItem(height: 250);
            });
          }),
          gapH24,
          Consumer(builder: (context, ref, _) {
            final popularMovieProvider = fetchListPopularMovieProvider(null);
            final popularMovieAsyncValue = ref.watch(popularMovieProvider);
            return popularMovieAsyncValue.when(data: (List<Movie> data) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(
                      title: HAppTranslation.popularMovies.t(context),
                      onPressed: () => AppRoutes.onSeeAllPressed(
                          context: context,
                          movies: data,
                          title: HAppTranslation.popularMovies.t(context))),
                  gapH12,
                  SizedBox(
                    height: 250,
                    child: ListView.separated(
                        padding: hAppDefaultPaddingLR,
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
              return ErrorWidgetItem(
                error: error.toString(),
              );
            }, loading: () {
              return const LoadingWidgetItem(height: 250);
            });
          }),
          gapBottomHeight,
        ]),
      ),
    );
  }

  Widget _buildSmallListSlider(List<Movie> movies, int selectedIndex) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
          controller: _scrollSilderController,
          padding: hAppDefaultPaddingLR,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    activeIndex = index;
                    _carouselController.animateToPage(activeIndex);
                    _scrollSilderController.animateTo(
                      hAppDefaultPadding +
                          activeIndex * 100 +
                          (activeIndex * hAppDefaultPadding),
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                    );
                  });
                },
                child: SmallSilderItem(
                  movie: movies[index],
                  selectedIndex: selectedIndex,
                  index: index,
                ),
              ),
          separatorBuilder: (context, index) => gapW8,
          itemCount: 6),
    );
  }

  AnimatedSmoothIndicator _buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: 6,
      effect: const WormEffect(
          dotWidth: 24.0,
          spacing: 4.0,
          dotHeight: 4.0,
          dotColor: HAppColor.anotherColor,
          activeDotColor: HAppColor.bluePrimaryColor),
    );
  }

  CarouselSlider _buildCarouselSlider(
      double height, List<Movie> data, double width) {
    return CarouselSlider(
      carouselController: _carouselController,
      options: CarouselOptions(
        height: height * 0.6,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 10),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        onPageChanged: (index, reason) {
          setState(() {
            activeIndex = index;
            _scrollSilderController.animateTo(
              activeIndex * 100,
              duration: const Duration(milliseconds: 100),
              curve: Curves.bounceInOut,
            );
          });
        },
      ),
      items: data.take(6).map((movie) {
        return Consumer(
          builder: (context, ref, child) {
            return CarouselSliderMovie(
              movie: movie,
              onPressed: () {
                ref
                    .read(historyMovieProvider.notifier)
                    .addMovieToHistory(movie);
                AppRoutes.onMoviePressed(context, movie);
              },
            );
          },
        );
      }).toList(),
    );
  }
}
