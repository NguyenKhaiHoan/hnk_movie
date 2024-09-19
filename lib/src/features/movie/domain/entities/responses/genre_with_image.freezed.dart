// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genre_with_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenreWithImage _$GenreWithImageFromJson(Map<String, dynamic> json) {
  return _GenreWithImage.fromJson(json);
}

/// @nodoc
mixin _$GenreWithImage {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenreWithImageCopyWith<GenreWithImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreWithImageCopyWith<$Res> {
  factory $GenreWithImageCopyWith(
          GenreWithImage value, $Res Function(GenreWithImage) then) =
      _$GenreWithImageCopyWithImpl<$Res, GenreWithImage>;
  @useResult
  $Res call({int id, String name, String image});
}

/// @nodoc
class _$GenreWithImageCopyWithImpl<$Res, $Val extends GenreWithImage>
    implements $GenreWithImageCopyWith<$Res> {
  _$GenreWithImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenreWithImageImplCopyWith<$Res>
    implements $GenreWithImageCopyWith<$Res> {
  factory _$$GenreWithImageImplCopyWith(_$GenreWithImageImpl value,
          $Res Function(_$GenreWithImageImpl) then) =
      __$$GenreWithImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String image});
}

/// @nodoc
class __$$GenreWithImageImplCopyWithImpl<$Res>
    extends _$GenreWithImageCopyWithImpl<$Res, _$GenreWithImageImpl>
    implements _$$GenreWithImageImplCopyWith<$Res> {
  __$$GenreWithImageImplCopyWithImpl(
      _$GenreWithImageImpl _value, $Res Function(_$GenreWithImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_$GenreWithImageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenreWithImageImpl implements _GenreWithImage {
  const _$GenreWithImageImpl(
      {required this.id, required this.name, required this.image});

  factory _$GenreWithImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenreWithImageImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String image;

  @override
  String toString() {
    return 'GenreWithImage(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenreWithImageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenreWithImageImplCopyWith<_$GenreWithImageImpl> get copyWith =>
      __$$GenreWithImageImplCopyWithImpl<_$GenreWithImageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenreWithImageImplToJson(
      this,
    );
  }
}

abstract class _GenreWithImage implements GenreWithImage {
  const factory _GenreWithImage(
      {required final int id,
      required final String name,
      required final String image}) = _$GenreWithImageImpl;

  factory _GenreWithImage.fromJson(Map<String, dynamic> json) =
      _$GenreWithImageImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$GenreWithImageImplCopyWith<_$GenreWithImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
