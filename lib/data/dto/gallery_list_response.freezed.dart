// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GalleryListResponse _$GalleryListResponseFromJson(Map<String, dynamic> json) {
  return _GalleryListResponse.fromJson(json);
}

/// @nodoc
mixin _$GalleryListResponse {
  @JsonKey(name: "gallery")
  List<Gallery> get gallery => throw _privateConstructorUsedError;

  /// Serializes this GalleryListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GalleryListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GalleryListResponseCopyWith<GalleryListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryListResponseCopyWith<$Res> {
  factory $GalleryListResponseCopyWith(
          GalleryListResponse value, $Res Function(GalleryListResponse) then) =
      _$GalleryListResponseCopyWithImpl<$Res, GalleryListResponse>;
  @useResult
  $Res call({@JsonKey(name: "gallery") List<Gallery> gallery});
}

/// @nodoc
class _$GalleryListResponseCopyWithImpl<$Res, $Val extends GalleryListResponse>
    implements $GalleryListResponseCopyWith<$Res> {
  _$GalleryListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GalleryListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gallery = null,
  }) {
    return _then(_value.copyWith(
      gallery: null == gallery
          ? _value.gallery
          : gallery // ignore: cast_nullable_to_non_nullable
              as List<Gallery>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GalleryListResponseImplCopyWith<$Res>
    implements $GalleryListResponseCopyWith<$Res> {
  factory _$$GalleryListResponseImplCopyWith(_$GalleryListResponseImpl value,
          $Res Function(_$GalleryListResponseImpl) then) =
      __$$GalleryListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "gallery") List<Gallery> gallery});
}

/// @nodoc
class __$$GalleryListResponseImplCopyWithImpl<$Res>
    extends _$GalleryListResponseCopyWithImpl<$Res, _$GalleryListResponseImpl>
    implements _$$GalleryListResponseImplCopyWith<$Res> {
  __$$GalleryListResponseImplCopyWithImpl(_$GalleryListResponseImpl _value,
      $Res Function(_$GalleryListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gallery = null,
  }) {
    return _then(_$GalleryListResponseImpl(
      gallery: null == gallery
          ? _value._gallery
          : gallery // ignore: cast_nullable_to_non_nullable
              as List<Gallery>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GalleryListResponseImpl implements _GalleryListResponse {
  const _$GalleryListResponseImpl(
      {@JsonKey(name: "gallery") required final List<Gallery> gallery})
      : _gallery = gallery;

  factory _$GalleryListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GalleryListResponseImplFromJson(json);

  final List<Gallery> _gallery;
  @override
  @JsonKey(name: "gallery")
  List<Gallery> get gallery {
    if (_gallery is EqualUnmodifiableListView) return _gallery;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gallery);
  }

  @override
  String toString() {
    return 'GalleryListResponse(gallery: $gallery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryListResponseImpl &&
            const DeepCollectionEquality().equals(other._gallery, _gallery));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_gallery));

  /// Create a copy of GalleryListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GalleryListResponseImplCopyWith<_$GalleryListResponseImpl> get copyWith =>
      __$$GalleryListResponseImplCopyWithImpl<_$GalleryListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GalleryListResponseImplToJson(
      this,
    );
  }
}

abstract class _GalleryListResponse implements GalleryListResponse {
  const factory _GalleryListResponse(
          {@JsonKey(name: "gallery") required final List<Gallery> gallery}) =
      _$GalleryListResponseImpl;

  factory _GalleryListResponse.fromJson(Map<String, dynamic> json) =
      _$GalleryListResponseImpl.fromJson;

  @override
  @JsonKey(name: "gallery")
  List<Gallery> get gallery;

  /// Create a copy of GalleryListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GalleryListResponseImplCopyWith<_$GalleryListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Gallery _$GalleryFromJson(Map<String, dynamic> json) {
  return _Gallery.fromJson(json);
}

/// @nodoc
mixin _$Gallery {
  @JsonKey(name: "image")
  String get image => throw _privateConstructorUsedError;

  /// Serializes this Gallery to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Gallery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GalleryCopyWith<Gallery> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryCopyWith<$Res> {
  factory $GalleryCopyWith(Gallery value, $Res Function(Gallery) then) =
      _$GalleryCopyWithImpl<$Res, Gallery>;
  @useResult
  $Res call({@JsonKey(name: "image") String image});
}

/// @nodoc
class _$GalleryCopyWithImpl<$Res, $Val extends Gallery>
    implements $GalleryCopyWith<$Res> {
  _$GalleryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Gallery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GalleryImplCopyWith<$Res> implements $GalleryCopyWith<$Res> {
  factory _$$GalleryImplCopyWith(
          _$GalleryImpl value, $Res Function(_$GalleryImpl) then) =
      __$$GalleryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "image") String image});
}

/// @nodoc
class __$$GalleryImplCopyWithImpl<$Res>
    extends _$GalleryCopyWithImpl<$Res, _$GalleryImpl>
    implements _$$GalleryImplCopyWith<$Res> {
  __$$GalleryImplCopyWithImpl(
      _$GalleryImpl _value, $Res Function(_$GalleryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Gallery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$GalleryImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GalleryImpl implements _Gallery {
  const _$GalleryImpl({@JsonKey(name: "image") required this.image});

  factory _$GalleryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GalleryImplFromJson(json);

  @override
  @JsonKey(name: "image")
  final String image;

  @override
  String toString() {
    return 'Gallery(image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryImpl &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, image);

  /// Create a copy of Gallery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GalleryImplCopyWith<_$GalleryImpl> get copyWith =>
      __$$GalleryImplCopyWithImpl<_$GalleryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GalleryImplToJson(
      this,
    );
  }
}

abstract class _Gallery implements Gallery {
  const factory _Gallery(
      {@JsonKey(name: "image") required final String image}) = _$GalleryImpl;

  factory _Gallery.fromJson(Map<String, dynamic> json) = _$GalleryImpl.fromJson;

  @override
  @JsonKey(name: "image")
  String get image;

  /// Create a copy of Gallery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GalleryImplCopyWith<_$GalleryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
