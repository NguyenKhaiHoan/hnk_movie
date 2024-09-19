// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PersonDetail _$PersonDetailFromJson(Map<String, dynamic> json) {
  return _PersonDetail.fromJson(json);
}

/// @nodoc
mixin _$PersonDetail {
  bool get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'also_known_as')
  List<String> get alsoKnownAs => throw _privateConstructorUsedError;
  String get biography => throw _privateConstructorUsedError;
  String get birthday => throw _privateConstructorUsedError;
  String? get deathday => throw _privateConstructorUsedError;
  int get gender => throw _privateConstructorUsedError;
  String? get homepage => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'imdb_id')
  String get imdbId => throw _privateConstructorUsedError;
  @JsonKey(name: 'known_for_department')
  String get knownForDepartment => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_of_birth')
  String get placeOfBirth => throw _privateConstructorUsedError;
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_path')
  String get profilePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonDetailCopyWith<PersonDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonDetailCopyWith<$Res> {
  factory $PersonDetailCopyWith(
          PersonDetail value, $Res Function(PersonDetail) then) =
      _$PersonDetailCopyWithImpl<$Res, PersonDetail>;
  @useResult
  $Res call(
      {bool adult,
      @JsonKey(name: 'also_known_as') List<String> alsoKnownAs,
      String biography,
      String birthday,
      String? deathday,
      int gender,
      String? homepage,
      int id,
      @JsonKey(name: 'imdb_id') String imdbId,
      @JsonKey(name: 'known_for_department') String knownForDepartment,
      String name,
      @JsonKey(name: 'place_of_birth') String placeOfBirth,
      double popularity,
      @JsonKey(name: 'profile_path') String profilePath});
}

/// @nodoc
class _$PersonDetailCopyWithImpl<$Res, $Val extends PersonDetail>
    implements $PersonDetailCopyWith<$Res> {
  _$PersonDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? alsoKnownAs = null,
    Object? biography = null,
    Object? birthday = null,
    Object? deathday = freezed,
    Object? gender = null,
    Object? homepage = freezed,
    Object? id = null,
    Object? imdbId = null,
    Object? knownForDepartment = null,
    Object? name = null,
    Object? placeOfBirth = null,
    Object? popularity = null,
    Object? profilePath = null,
  }) {
    return _then(_value.copyWith(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      alsoKnownAs: null == alsoKnownAs
          ? _value.alsoKnownAs
          : alsoKnownAs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      biography: null == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      deathday: freezed == deathday
          ? _value.deathday
          : deathday // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imdbId: null == imdbId
          ? _value.imdbId
          : imdbId // ignore: cast_nullable_to_non_nullable
              as String,
      knownForDepartment: null == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      placeOfBirth: null == placeOfBirth
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      profilePath: null == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonDetailImplCopyWith<$Res>
    implements $PersonDetailCopyWith<$Res> {
  factory _$$PersonDetailImplCopyWith(
          _$PersonDetailImpl value, $Res Function(_$PersonDetailImpl) then) =
      __$$PersonDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool adult,
      @JsonKey(name: 'also_known_as') List<String> alsoKnownAs,
      String biography,
      String birthday,
      String? deathday,
      int gender,
      String? homepage,
      int id,
      @JsonKey(name: 'imdb_id') String imdbId,
      @JsonKey(name: 'known_for_department') String knownForDepartment,
      String name,
      @JsonKey(name: 'place_of_birth') String placeOfBirth,
      double popularity,
      @JsonKey(name: 'profile_path') String profilePath});
}

/// @nodoc
class __$$PersonDetailImplCopyWithImpl<$Res>
    extends _$PersonDetailCopyWithImpl<$Res, _$PersonDetailImpl>
    implements _$$PersonDetailImplCopyWith<$Res> {
  __$$PersonDetailImplCopyWithImpl(
      _$PersonDetailImpl _value, $Res Function(_$PersonDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? alsoKnownAs = null,
    Object? biography = null,
    Object? birthday = null,
    Object? deathday = freezed,
    Object? gender = null,
    Object? homepage = freezed,
    Object? id = null,
    Object? imdbId = null,
    Object? knownForDepartment = null,
    Object? name = null,
    Object? placeOfBirth = null,
    Object? popularity = null,
    Object? profilePath = null,
  }) {
    return _then(_$PersonDetailImpl(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      alsoKnownAs: null == alsoKnownAs
          ? _value._alsoKnownAs
          : alsoKnownAs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      biography: null == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      deathday: freezed == deathday
          ? _value.deathday
          : deathday // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imdbId: null == imdbId
          ? _value.imdbId
          : imdbId // ignore: cast_nullable_to_non_nullable
              as String,
      knownForDepartment: null == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      placeOfBirth: null == placeOfBirth
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      profilePath: null == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonDetailImpl implements _PersonDetail {
  const _$PersonDetailImpl(
      {required this.adult,
      @JsonKey(name: 'also_known_as') required final List<String> alsoKnownAs,
      required this.biography,
      required this.birthday,
      this.deathday,
      required this.gender,
      this.homepage,
      required this.id,
      @JsonKey(name: 'imdb_id') required this.imdbId,
      @JsonKey(name: 'known_for_department') required this.knownForDepartment,
      required this.name,
      @JsonKey(name: 'place_of_birth') required this.placeOfBirth,
      required this.popularity,
      @JsonKey(name: 'profile_path') required this.profilePath})
      : _alsoKnownAs = alsoKnownAs;

  factory _$PersonDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonDetailImplFromJson(json);

  @override
  final bool adult;
  final List<String> _alsoKnownAs;
  @override
  @JsonKey(name: 'also_known_as')
  List<String> get alsoKnownAs {
    if (_alsoKnownAs is EqualUnmodifiableListView) return _alsoKnownAs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alsoKnownAs);
  }

  @override
  final String biography;
  @override
  final String birthday;
  @override
  final String? deathday;
  @override
  final int gender;
  @override
  final String? homepage;
  @override
  final int id;
  @override
  @JsonKey(name: 'imdb_id')
  final String imdbId;
  @override
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  @override
  final String name;
  @override
  @JsonKey(name: 'place_of_birth')
  final String placeOfBirth;
  @override
  final double popularity;
  @override
  @JsonKey(name: 'profile_path')
  final String profilePath;

  @override
  String toString() {
    return 'PersonDetail(adult: $adult, alsoKnownAs: $alsoKnownAs, biography: $biography, birthday: $birthday, deathday: $deathday, gender: $gender, homepage: $homepage, id: $id, imdbId: $imdbId, knownForDepartment: $knownForDepartment, name: $name, placeOfBirth: $placeOfBirth, popularity: $popularity, profilePath: $profilePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonDetailImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            const DeepCollectionEquality()
                .equals(other._alsoKnownAs, _alsoKnownAs) &&
            (identical(other.biography, biography) ||
                other.biography == biography) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.deathday, deathday) ||
                other.deathday == deathday) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.homepage, homepage) ||
                other.homepage == homepage) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imdbId, imdbId) || other.imdbId == imdbId) &&
            (identical(other.knownForDepartment, knownForDepartment) ||
                other.knownForDepartment == knownForDepartment) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.placeOfBirth, placeOfBirth) ||
                other.placeOfBirth == placeOfBirth) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      adult,
      const DeepCollectionEquality().hash(_alsoKnownAs),
      biography,
      birthday,
      deathday,
      gender,
      homepage,
      id,
      imdbId,
      knownForDepartment,
      name,
      placeOfBirth,
      popularity,
      profilePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonDetailImplCopyWith<_$PersonDetailImpl> get copyWith =>
      __$$PersonDetailImplCopyWithImpl<_$PersonDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonDetailImplToJson(
      this,
    );
  }
}

abstract class _PersonDetail implements PersonDetail {
  const factory _PersonDetail(
      {required final bool adult,
      @JsonKey(name: 'also_known_as') required final List<String> alsoKnownAs,
      required final String biography,
      required final String birthday,
      final String? deathday,
      required final int gender,
      final String? homepage,
      required final int id,
      @JsonKey(name: 'imdb_id') required final String imdbId,
      @JsonKey(name: 'known_for_department')
      required final String knownForDepartment,
      required final String name,
      @JsonKey(name: 'place_of_birth') required final String placeOfBirth,
      required final double popularity,
      @JsonKey(name: 'profile_path')
      required final String profilePath}) = _$PersonDetailImpl;

  factory _PersonDetail.fromJson(Map<String, dynamic> json) =
      _$PersonDetailImpl.fromJson;

  @override
  bool get adult;
  @override
  @JsonKey(name: 'also_known_as')
  List<String> get alsoKnownAs;
  @override
  String get biography;
  @override
  String get birthday;
  @override
  String? get deathday;
  @override
  int get gender;
  @override
  String? get homepage;
  @override
  int get id;
  @override
  @JsonKey(name: 'imdb_id')
  String get imdbId;
  @override
  @JsonKey(name: 'known_for_department')
  String get knownForDepartment;
  @override
  String get name;
  @override
  @JsonKey(name: 'place_of_birth')
  String get placeOfBirth;
  @override
  double get popularity;
  @override
  @JsonKey(name: 'profile_path')
  String get profilePath;
  @override
  @JsonKey(ignore: true)
  _$$PersonDetailImplCopyWith<_$PersonDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
