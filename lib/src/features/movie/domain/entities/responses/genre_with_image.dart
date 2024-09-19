import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hnk_movie/src/core/constants/translation.dart';

part 'genre_with_image.freezed.dart';
part 'genre_with_image.g.dart';

@freezed
class GenreWithImage with _$GenreWithImage {
  const factory GenreWithImage({
    required int id,
    required String name,
    required String image,
  }) = _GenreWithImage;

  factory GenreWithImage.fromJson(Map<String, dynamic> json) =>
      _$GenreWithImageFromJson(json);
}

final genrelist = [
  {
    "id": 28,
    "name": HAppTranslation.action,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/3FUJT82YKY1EJ1dmunQhW5PUZAT.jpg",
  },
  {
    "id": 12,
    "name": HAppTranslation.adventure,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/tOEOlmLP71IojeJ91dyJ9Nsb8O8.jpg",
  },
  {
    "id": 16,
    "name": HAppTranslation.animation,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/4nssBcQUBadCTBjrAkX46mVEKts.jpg",
  },
  {
    "id": 35,
    "name": HAppTranslation.comedy,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8kOWDBK6XlPUzckuHDo3wwVRFwt.jpg",
  },
  {
    "id": 80,
    "name": HAppTranslation.crime,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/6PX0r5TRRU5y0jZ70y1OtbLYmoD.jpg",
  },
  {
    "id": 99,
    "name": HAppTranslation.documentary,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/n0ybibhJtQ5icDqTp8eRytcIHJx.jpg",
  },
  {
    "id": 18,
    "name": HAppTranslation.drama,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/nel144y4dIOdFFid6twN5mAX9Yd.jpg",
  },
  {
    "id": 10751,
    "name": HAppTranslation.family,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uwslHj6nEyPX5IbNXhuEeI0PTth.jpg",
  },
  {
    "id": 14,
    "name": HAppTranslation.fantasy,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kEl2t3OhXc3Zb9FBh1AuYzRTgZp.jpg",
  },
  {
    "id": 36,
    "name": HAppTranslation.history,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/bQLrHIRNEkE3PdIWQrZHynQZazu.jpg",
  },
  {
    "id": 27,
    "name": HAppTranslation.horror,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7pEn2fCFWa8DIwQnxG6Cq7iaKLv.jpg",
  },
  {
    "id": 10402,
    "name": HAppTranslation.music,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/gbmkFWdtihe1VfydTDsieQ6VfGL.jpg",
  },
  {
    "id": 9648,
    "name": HAppTranslation.mystery,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/o6qT33idpxWV51FsIjAyGDyp5Ou.jpg",
  },
  {
    "id": 10749,
    "name": HAppTranslation.romance,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/9yguvvrOG8dBVIbxCst0GyzVJu1.jpg",
  },
  {
    "id": 878,
    "name": HAppTranslation.scienceFiction,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/th5UkDLIa7yyma9UYDAWaIgDh6z.jpg",
  },
  {
    "id": 53,
    "name": HAppTranslation.thriller,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/vqzNJRH4YyquRiWxCCOH0aXggHI.jpg",
  },
  {
    "id": 10752,
    "name": HAppTranslation.war,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/34nDCQZwaEvsy4CFO5hkGRFDCVU.jpg",
  },
  {
    "id": 37,
    "name": HAppTranslation.western,
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uHA5COgDzcxjpYSHHulrKVl6ByL.jpg",
  },
];
