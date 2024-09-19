import 'package:flutter/material.dart';
import 'package:hnk_movie/src/config/theme/color.dart';
import 'package:hnk_movie/src/config/theme/style.dart';
import 'package:hnk_movie/src/core/constants/api.dart';
import 'package:hnk_movie/src/core/constants/size.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/genre_with_image.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/movie.dart';

class BottomAppBarDetailMovie extends StatelessWidget {
  const BottomAppBarDetailMovie({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  HAppAPI.imageBaseUrl + (movie.backdropPath ?? '')),
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
              Row(
                children: [
                  Image.asset('assets/images/imdb_logo.png', height: 12),
                  gapW4,
                  Text(
                    movie.voteAverage.toString(),
                    style: HAppStyle.paragraph2Regular,
                  )
                ],
              ),
              gapH12,
              Text(
                movie.title ?? '',
                style: HAppStyle.heading3Style,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              (movie.genreIds ?? []).isNotEmpty
                  ? SizedBox(
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var genreList = genrelist
                                  .map(
                                      (genre) => GenreWithImage.fromJson(genre))
                                  .toList();
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: HAppColor.bluePrimaryColor,
                                    )),
                                child: Center(
                                    child: Text(
                                  genreList
                                      .firstWhere((element) =>
                                          element.id == movie.genreIds![index])
                                      .name,
                                  style: HAppStyle.paragraph3Regular.copyWith(
                                      color: HAppColor.bluePrimaryColor),
                                )),
                              );
                            },
                            separatorBuilder: (context, index) => gapW10,
                            itemCount: movie.genreIds!.length),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
