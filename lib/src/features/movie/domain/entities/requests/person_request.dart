class PersonRequest {
  final int personId;
  final String language;

  const PersonRequest({
    required this.personId,
    this.language = 'en-US',
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonRequest &&
          runtimeType == other.runtimeType &&
          personId == other.personId &&
          language == other.language);

  @override
  int get hashCode => personId.hashCode ^ language.hashCode;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'personId': personId,
      'language': language,
    };
  }

  PersonRequest copyWith({
    int? personId,
    String? language,
  }) {
    return PersonRequest(
      personId: personId ?? this.personId,
      language: language ?? this.language,
    );
  }
}
