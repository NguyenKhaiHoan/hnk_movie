import 'package:flutter/material.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/commons/widgets/network_image.dart';
import 'package:hnk_movie/src/core/constants/api.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie_credits_response.dart';

class CreditsCastVerticalItem extends StatelessWidget {
  const CreditsCastVerticalItem({
    super.key,
    required this.movie,
  });

  final CreditsCast movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: HNetworkImage(
            url: HAppAPI.imageBaseUrl + (movie.posterPath ?? ''),
            height: 250,
            width: 150,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/imdb_logo.png', height: 10),
                  gapW4,
                  Text(
                    movie.voteAverage.toString(),
                    style: HAppStyle.paragraph3Regular,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
