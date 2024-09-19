class SearchPersonRequest {
  final String query;
  final bool includeAdult;
  final String language;
  final int page;

  const SearchPersonRequest({
    required this.query,
    this.includeAdult = false,
    this.language = 'en-US',
    this.page = 1,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchPersonRequest &&
          runtimeType == other.runtimeType &&
          query == other.query &&
          includeAdult == other.includeAdult &&
          language == other.language &&
          page == other.page);

  @override
  int get hashCode =>
      query.hashCode ^
      includeAdult.hashCode ^
      language.hashCode ^
      page.hashCode;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'query': query,
      'include_adult': includeAdult,
      'language': language,
      'page': page,
    };
  }

  SearchPersonRequest copyWith({
    String? query,
    bool? includeAdult,
    String? language,
    int? page,
  }) {
    return SearchPersonRequest(
      query: query ?? this.query,
      includeAdult: includeAdult ?? this.includeAdult,
      language: language ?? this.language,
      page: page ?? this.page,
    );
  }
}
