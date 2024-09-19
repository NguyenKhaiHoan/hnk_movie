// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/commons/widgets/circle_button_appbar.dart';
import 'package:hnk_movie/src/core/commons/widgets/error_widget.dart';
import 'package:hnk_movie/src/core/commons/widgets/load_widget.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/features/app/presentation/providers/language_provider.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/requests/movie_detail_request.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/video.dart';
import 'package:hnk_movie/src/features/movie/presentation/providers/detail_movie_provider.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerTabView extends StatelessWidget {
  const TrailerTabView({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final movieRequest = MovieSimpleRequest(
          movieId: movie.id!,
          language:
              ref.watch(languageControllerProvider).locale.languageCode == 'en'
                  ? 'en-US'
                  : 'vi-VN');
      final videosMovieProvider = fetchListVideoMovieProvider(movieRequest);
      final videosMovieAsyncValue = ref.watch(videosMovieProvider);
      return videosMovieAsyncValue.when(data: (data) {
        var videos = data
            .where(
                (video) => video.site == 'YouTube' && video.type == 'Trailer')
            .toList();
        return ListView.separated(
          shrinkWrap: true,
          padding: hAppDefaultPaddingLTRB,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            var video = videos[index];
            return GestureDetector(
              onTap: null,
              child: TrailerMovieItem(
                video: video,
                imagePath: movie.posterPath ?? '',
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => gapH10,
          itemCount: videos.length,
        );
      }, error: (Object error, StackTrace stackTrace) {
        return const ErrorWidgetItem();
      }, loading: () {
        return const LoadingWidgetItem(height: 250);
      });
    });
  }
}

class TrailerMovieItem extends StatefulWidget {
  const TrailerMovieItem({
    super.key,
    required this.video,
    required this.imagePath,
  });

  final Video video;
  final String imagePath;

  @override
  State<TrailerMovieItem> createState() => _TrailerMovieItemState();
}

class _TrailerMovieItemState extends State<TrailerMovieItem> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.video.key!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _controller.toggleFullScreenMode(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AbsorbPointer(
            child: SizedBox(
              height: 100,
              width: 150,
              child: YoutubePlayerTrailers(controller: _controller),
            ),
          ),
          gapW10,
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.video.name!,
                style: HAppStyle.heading5Style,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              gapH6,
              Text(
                DateFormat('dd/MM/yyyy HH:mm:ss')
                    .format(widget.video.publishedAt!),
                style: HAppStyle.paragraph2Regular
                    .copyWith(color: HAppColor.greyColor),
              )
            ],
          ))
        ],
      ),
    );
  }
}

class YoutubePlayerTrailers extends StatelessWidget {
  const YoutubePlayerTrailers({
    super.key,
    required YoutubePlayerController controller,
  }) : _controller = controller;

  final YoutubePlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onEnterFullScreen: () {},
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: HAppColor.bluePrimaryColor,
        bottomActions: [
          CurrentPosition(),
          ProgressBar(
            isExpanded: true,
            colors: const ProgressBarColors(
                handleColor: HAppColor.bluePrimaryColor,
                playedColor: HAppColor.blueSecondaryColor),
          ),
          FullScreenButton(),
          PlayPauseButton(
            controller: _controller,
            bufferIndicator:
                const HCircleIcon(icon: Icon(PhosphorIconsFill.play)),
          )
        ],
      ),
      builder: (_, player) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: player,
        );
      },
    );
  }
}
