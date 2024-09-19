import 'package:flutter/material.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/commons/widgets/blur_widget.dart';
import 'package:hnk_movie/src/core/commons/widgets/network_image.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/genre_with_image.dart';

class FeaturedCategoriesItem extends StatelessWidget {
  const FeaturedCategoriesItem({
    super.key,
    required this.height,
    required this.width,
    required this.genre,
  });
  final double height;
  final double width;
  final GenreWithImage genre;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: HNetworkImage(
            url: genre.image,
            height: height,
            width: width,
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: BlurWidget(
                child: Padding(
                  padding: hTextSmallDefaultPadding,
                  child: Text(
                    genre.name,
                    style: HAppStyle.paragraph3Bold,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
