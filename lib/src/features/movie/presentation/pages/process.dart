import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/core/commons/widgets/back_button.dart';
import 'package:hnk_movie/src/core/commons/widgets/background_filter.dart';
import 'package:hnk_movie/src/core/commons/widgets/blur_widget.dart';
import 'package:hnk_movie/src/core/commons/widgets/load_image.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/core/constants/translation.dart';
import 'package:hnk_movie/src/core/extensions/string.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/genre_with_image.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/genre_provider.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/process_controller_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/style.dart';
import '../../../../core/commons/widgets/error_image.dart';

class ProcessPage extends StatelessWidget {
  const ProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundFilterImage(
            imagePath: 'assets/images/background_welcome.jpg',
            colors: listColorProcess,
          ),
          CustomScrollView(
            slivers: <Widget>[
              const ProcessAppBar(),
              SliverToBoxAdapter(
                child: Consumer(
                  builder: (context, ref, child) {
                    var listGenre = ref.watch(genreProvider);
                    return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var genre = listGenre[index];
                          return ProcessItem(genre: genre);
                        },
                        separatorBuilder: (context, index) => gapH8,
                        itemCount: listGenre.length);
                  },
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
          padding: hAppDefaultPaddingLTRB,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer(builder: (context, ref, _) {
                var state = ref.watch(processControllerProvider);
                return SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom().copyWith(
                          backgroundColor: const WidgetStatePropertyAll(
                              HAppColor.whileColor)),
                      onPressed: () {
                        if (state.genres.isNotEmpty) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/base', (Route<dynamic> route) => false);
                        }
                      },
                      child: Text(
                        state.genres.isEmpty
                            ? HAppTranslation.selectAtLeast1.t(context)
                            : HAppTranslation.done.t(context),
                        style: HAppStyle.label2Bold
                            .copyWith(color: HAppColor.otherColor),
                      )),
                );
              })
            ],
          )),
    );
  }
}

class ProcessAppBar extends StatelessWidget {
  const ProcessAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (BuildContext context, constraints) {
        final scrolled = constraints.scrollOffset > 80;
        return SliverAppBar(
          backgroundColor: scrolled ? HAppColor.otherColor : Colors.transparent,
          leading: const BackCircleButton(),
          centerTitle: true,
          expandedHeight: 140,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: const EdgeInsets.symmetric(
                vertical: hAppDefaultPadding,
                horizontal: hAppDefaultPadding * 4),
            background: Container(color: Colors.transparent),
            title: Text(
              HAppTranslation.pickWhatYoudLikeToWatch.t(context),
              style: HAppStyle.heading4Style,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}

class GenreItem extends StatelessWidget {
  const GenreItem({
    super.key,
    required this.image,
    required this.genre,
    required this.isPicked,
  });

  final Widget image;
  final GenreWithImage genre;
  final bool isPicked;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image,
        isPicked
            ? const Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    PhosphorIconsFill.checkCircle,
                    color: HAppColor.bluePrimaryColor,
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}

class ProcessItem extends StatelessWidget {
  const ProcessItem({super.key, required this.genre});

  final GenreWithImage genre;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var state = ref.watch(processControllerProvider);
        return Padding(
            padding: hAppDefaultPaddingLR,
            child: GestureDetector(
              onTap: () => state.genres.contains(genre)
                  ? ref
                      .read(processControllerProvider.notifier)
                      .removeGenre(genre)
                  : ref
                      .read(processControllerProvider.notifier)
                      .addGenre(genre),
              child: GenreItem(
                  image: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: state.genres.contains(genre)
                                ? HAppColor.bluePrimaryColor
                                : HAppColor.transparentColor),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: genre.image,
                        imageBuilder: (context, imageProvider) => ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                              height: 170,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Center(
                                child: SizedBox(
                                  child: BlurWidget(
                                    child: Padding(
                                      padding: hTextSmallDefaultPadding,
                                      child: Text(
                                        genre.name.t(context),
                                        style: HAppStyle.paragraph3Bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        placeholder: (context, url) => LoadingImageWidget(
                          height: 170,
                          width: MediaQuery.of(context).size.width,
                        ),
                        errorWidget: (context, url, error) => ErrorImageWidget(
                          height: 170,
                          width: MediaQuery.of(context).size.width,
                        ),
                      )),
                  genre: genre,
                  isPicked: state.genres.contains(genre)),
            ));
      },
    );
  }
}
