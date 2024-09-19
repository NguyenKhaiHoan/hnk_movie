// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieSimpleRequest {
  final String language;
  final int movieId;
  MovieSimpleRequest({
    required this.movieId,
    this.language = 'en-US',
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'language': language,
      'movie_id': movieId,
    };
  }

  @override
  bool operator ==(covariant MovieSimpleRequest other) {
    if (identical(this, other)) return true;

    return other.language == language && other.movieId == movieId;
  }

  @override
  int get hashCode => language.hashCode ^ movieId.hashCode;

  MovieSimpleRequest copyWith({
    String? language,
    int? movieId,
  }) {
    return MovieSimpleRequest(
      language: language ?? this.language,
      movieId: movieId ?? this.movieId,
    );
  }
}
