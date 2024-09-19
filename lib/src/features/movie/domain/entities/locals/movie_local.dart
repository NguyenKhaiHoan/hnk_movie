class MovieLocal {
  int? id;
  String? title;
  String? posterPath;

  MovieLocal({
    this.id,
    this.title,
    this.posterPath,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieLocal &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          posterPath == other.posterPath);

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ posterPath.hashCode;

  MovieLocal copyWith({
    int? id,
    String? title,
    String? posterPath,
  }) {
    return MovieLocal(
      id: id ?? this.id,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'posterPath': posterPath,
    };
  }

  factory MovieLocal.fromJson(Map<String, dynamic> map) {
    return MovieLocal(
      id: map['id'] as int?,
      title: map['title'] as String?,
      posterPath: map['posterPath'] as String?,
    );
  }
}
