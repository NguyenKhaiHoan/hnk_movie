import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_movie/src/features/movie/domain/entities/responses/genre_with_image.dart';

final genreProvider = Provider<List<GenreWithImage>>((ref) {
  var list = genrelist.map((genre) => GenreWithImage.fromJson(genre)).toList();
  return list;
});
