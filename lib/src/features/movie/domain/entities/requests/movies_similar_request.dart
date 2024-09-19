// ignore_for_file: public_member_api_docs, sort_constructors_first
class MoviesSimilarRequest {
  final String language;
  final int page;
  final int movieId;
  MoviesSimilarRequest({
    required this.movieId,
    this.language = 'en-US',
    this.page = 1,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'language': language,
      'page': page,
      'movie_id': movieId,
    };
  }

  @override
  bool operator ==(covariant MoviesSimilarRequest other) {
    if (identical(this, other)) return true;

    return other.language == language &&
        other.page == page &&
        other.movieId == movieId;
  }

  @override
  int get hashCode => language.hashCode ^ page.hashCode ^ movieId.hashCode;

  MoviesSimilarRequest copyWith({
    String? language,
    int? page,
    int? movieId,
  }) {
    return MoviesSimilarRequest(
      language: language ?? this.language,
      page: page ?? this.page,
      movieId: movieId ?? this.movieId,
    );
  }
}
