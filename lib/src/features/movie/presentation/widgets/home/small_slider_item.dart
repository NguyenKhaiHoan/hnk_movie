import 'package:flutter/material.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/core/commons/widgets/network_image.dart';
import 'package:hnk_movie/src/core/constants/api.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';

class SmallSilderItem extends StatelessWidget {
  const SmallSilderItem({
    super.key,
    required this.movie,
    required this.selectedIndex,
    required this.index,
  });

  final Movie movie;
  final int selectedIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: HNetworkImage(
              url: HAppAPI.imageBaseUrl + (movie.posterPath ?? ''),
              height: 70,
              width: 100,
            )),
        selectedIndex != index
            ? Container(
                height: 70,
                width: 100,
                color: HAppColor.blackColor.withOpacity(0.7),
              )
            : const SizedBox()
      ],
    );
  }
}
