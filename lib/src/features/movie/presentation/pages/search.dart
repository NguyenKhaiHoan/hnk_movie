import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/routes/routes.dart';
import 'package:hnk_movie/src/core/commons/widgets/error_widget.dart';
import 'package:hnk_movie/src/core/commons/widgets/load_widget.dart';
import 'package:hnk_movie/src/core/commons/widgets/search_field.dart';
import 'package:hnk_movie/src/core/commons/widgets/section_title.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/core/constants/translation.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';
import 'package:hnk_movie/src/features/app/presentation/providers/language_provider.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/search_movie_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/search_person_request.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/list_movie_provider.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/search_provider.dart';
import 'package:hnk_movie/src/features/movie/presentation/widgets/movie_item.dart';
import 'package:hnk_movie/src/features/movie/presentation/widgets/person_result_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;
  final isSearched = false;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Consumer(
              builder: (context, ref, child) {
                var state = ref.watch(searchStringProvider);
                return Padding(
                  padding: hAppDefaultPaddingLR,
                  child: Row(
                    children: [
                      Expanded(
                          child: HSearchField(
                        hintText: HAppTranslation.search.t(context),
                        controller: _searchController,
                        hasSuffix:
                            _searchController.text.isEmpty || state.isEmpty
                                ? false
                                : true,
                        clear: () {
                          _searchController.clear();
                          ref
                              .read(searchStringProvider.notifier)
                              .update((state) => state = '');
                        },
                        onFieldSubmitted: (value) {
                          ref
                              .read(searchMovieDataProvider.notifier)
                              .searchMovie(SearchMovieRequest(
                                  query: state,
                                  language: ref
                                              .watch(languageControllerProvider)
                                              .locale
                                              .languageCode ==
                                          'en'
                                      ? 'en-US'
                                      : 'vi-VN'));
                          ref
                              .read(searchPersonDataProvider.notifier)
                              .searchPerson(SearchPersonRequest(
                                  query: state,
                                  language: ref
                                              .watch(languageControllerProvider)
                                              .locale
                                              .languageCode ==
                                          'en'
                                      ? 'en-US'
                                      : 'vi-VN'));
                        },
                      )),
                    ],
                  ),
                );
              },
            )),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            MovieResults(),
            gapH16,
            PersonResults(),
          ],
        ),
      ),
    );
  }
}

class MovieResults extends StatelessWidget {
  const MovieResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final searchMovieAsyncValue = ref.watch(searchMovieDataProvider);
      return searchMovieAsyncValue.when(data: (data) {
        return data.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gapH16,
                  SectionTitle(
                      title: HAppTranslation.movies.t(context),
                      onPressed: () => AppRoutes.onSeeAllPressed(
                          context: context,
                          movies: data,
                          title: HAppTranslation.movies.t(context))),
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
              )
            : const SizedBox();
      }, error: (Object error, StackTrace stackTrace) {
        return const ErrorWidgetItem();
      }, loading: () {
        return const LoadingWidgetItem(height: 280);
      });
    });
  }
}

class PersonResults extends StatelessWidget {
  const PersonResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final searchPersonAsyncValue = ref.watch(searchPersonDataProvider);
      return searchPersonAsyncValue.when(data: (data) {
        return data.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gapH16,
                  SectionTitle(
                      title: HAppTranslation.actors.t(context),
                      onPressed: null),
                  gapH12,
                  SizedBox(
                    height: 310,
                    child: ListView.separated(
                        padding: hAppDefaultPaddingLR,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var person = data[index];
                          return GestureDetector(
                            onTap: () {},
                            child: PersonResultVerticalItem(person: person),
                          );
                        },
                        separatorBuilder: (context, index) => gapW8,
                        itemCount: 5),
                  )
                ],
              )
            : const SizedBox();
      }, error: (Object error, StackTrace stackTrace) {
        return const ErrorWidgetItem();
      }, loading: () {
        return const LoadingWidgetItem(height: 300);
      });
    });
  }
}
