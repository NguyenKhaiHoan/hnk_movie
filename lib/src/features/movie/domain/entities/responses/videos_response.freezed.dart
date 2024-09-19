// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'videos_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VideosResponse _$VideosResponseFromJson(Map<String, dynamic> json) {
  return _VideosResponse.fromJson(json);
}

/// @nodoc
mixin _$VideosResponse {
  int get id => throw _privateConstructorUsedError;
  List<Video> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideosResponseCopyWith<VideosResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideosResponseCopyWith<$Res> {
  factory $VideosResponseCopyWith(
          VideosResponse value, $Res Function(VideosResponse) then) =
      _$VideosResponseCopyWithImpl<$Res, VideosResponse>;
  @useResult
  $Res call({int id, List<Video> results});
}

/// @nodoc
class _$VideosResponseCopyWithImpl<$Res, $Val extends VideosResponse>
    implements $VideosResponseCopyWith<$Res> {
  _$VideosResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Video>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideosResponseImplCopyWith<$Res>
    implements $VideosResponseCopyWith<$Res> {
  factory _$$VideosResponseImplCopyWith(_$VideosResponseImpl value,
          $Res Function(_$VideosResponseImpl) then) =
      __$$VideosResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, List<Video> results});
}

/// @nodoc
class __$$VideosResponseImplCopyWithImpl<$Res>
    extends _$VideosResponseCopyWithImpl<$Res, _$VideosResponseImpl>
    implements _$$VideosResponseImplCopyWith<$Res> {
  __$$VideosResponseImplCopyWithImpl(
      _$VideosResponseImpl _value, $Res Function(_$VideosResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? results = null,
  }) {
    return _then(_$VideosResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Video>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideosResponseImpl implements _VideosResponse {
  _$VideosResponseImpl({required this.id, required final List<Video> results})
      : _results = results;

  factory _$VideosResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideosResponseImplFromJson(json);

  @override
  final int id;
  final List<Video> _results;
  @override
  List<Video> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'VideosResponse(id: $id, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideosResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideosResponseImplCopyWith<_$VideosResponseImpl> get copyWith =>
      __$$VideosResponseImplCopyWithImpl<_$VideosResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideosResponseImplToJson(
      this,
    );
  }
}

abstract class _VideosResponse implements VideosResponse {
  factory _VideosResponse(
      {required final int id,
      required final List<Video> results}) = _$VideosResponseImpl;

  factory _VideosResponse.fromJson(Map<String, dynamic> json) =
      _$VideosResponseImpl.fromJson;

  @override
  int get id;
  @override
  List<Video> get results;
  @override
  @JsonKey(ignore: true)
  _$$VideosResponseImplCopyWith<_$VideosResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
