// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieListsRequest {
  final String language;
  final int page;
  MovieListsRequest({
    this.language = 'en-US',
    this.page = 1,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'language': language,
      'page': page,
    };
  }

  @override
  bool operator ==(covariant MovieListsRequest other) {
    if (identical(this, other)) return true;

    return other.language == language && other.page == page;
  }

  @override
  int get hashCode => language.hashCode ^ page.hashCode;

  MovieListsRequest copyWith({
    String? language,
    int? page,
  }) {
    return MovieListsRequest(
      language: language ?? this.language,
      page: page ?? this.page,
    );
  }
}
