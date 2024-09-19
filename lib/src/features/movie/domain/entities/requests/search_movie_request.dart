class SearchMovieRequest {
  final String query;
  final bool includeAdult;
  final String language;
  final String? primaryReleaseYear;
  final int page;
  final String? region;
  final String? year;

  const SearchMovieRequest({
    required this.query,
    this.includeAdult = false,
    this.language = 'en-US',
    this.primaryReleaseYear,
    this.page = 1,
    this.region,
    this.year,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchMovieRequest &&
          runtimeType == other.runtimeType &&
          query == other.query &&
          includeAdult == other.includeAdult &&
          language == other.language &&
          primaryReleaseYear == other.primaryReleaseYear &&
          page == other.page &&
          region == other.region &&
          year == other.year);

  @override
  int get hashCode =>
      query.hashCode ^
      includeAdult.hashCode ^
      language.hashCode ^
      primaryReleaseYear.hashCode ^
      page.hashCode ^
      region.hashCode ^
      year.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'query': query,
      'includeAdult': includeAdult,
      'language': language,
      'primaryReleaseYear': primaryReleaseYear,
      'page': page,
      'region': region,
      'year': year,
    };
  }

  SearchMovieRequest copyWith({
    String? query,
    bool? includeAdult,
    String? language,
    String? primaryReleaseYear,
    int? page,
    String? region,
    String? year,
  }) {
    return SearchMovieRequest(
      query: query ?? this.query,
      includeAdult: includeAdult ?? this.includeAdult,
      language: language ?? this.language,
      primaryReleaseYear: primaryReleaseYear ?? this.primaryReleaseYear,
      page: page ?? this.page,
      region: region ?? this.region,
      year: year ?? this.year,
    );
  }
}
