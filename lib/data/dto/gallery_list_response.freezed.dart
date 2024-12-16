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

GalleryItemResponse _$GalleryItemResponseFromJson(Map<String, dynamic> json) {
  return _GalleryItemResponse.fromJson(json);
}

/// @nodoc
mixin _$GalleryItemResponse {
  @JsonKey(name: "id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "photos")
  List<Photo> get photos => throw _privateConstructorUsedError;
  @JsonKey(name: "portrait")
  bool get portrait => throw _privateConstructorUsedError;
  @JsonKey(name: "likes")
  Map<String, LikeDetail> get likes => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "visitId")
  String get visitId => throw _privateConstructorUsedError;

  /// Serializes this GalleryItemResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GalleryItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GalleryItemResponseCopyWith<GalleryItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryItemResponseCopyWith<$Res> {
  factory $GalleryItemResponseCopyWith(
          GalleryItemResponse value, $Res Function(GalleryItemResponse) then) =
      _$GalleryItemResponseCopyWithImpl<$Res, GalleryItemResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String id,
      @JsonKey(name: "photos") List<Photo> photos,
      @JsonKey(name: "portrait") bool portrait,
      @JsonKey(name: "likes") Map<String, LikeDetail> likes,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "visitId") String visitId});
}

/// @nodoc
class _$GalleryItemResponseCopyWithImpl<$Res, $Val extends GalleryItemResponse>
    implements $GalleryItemResponseCopyWith<$Res> {
  _$GalleryItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GalleryItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? photos = null,
    Object? portrait = null,
    Object? likes = null,
    Object? createdAt = null,
    Object? visitId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>,
      portrait: null == portrait
          ? _value.portrait
          : portrait // ignore: cast_nullable_to_non_nullable
              as bool,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as Map<String, LikeDetail>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      visitId: null == visitId
          ? _value.visitId
          : visitId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GalleryItemResponseImplCopyWith<$Res>
    implements $GalleryItemResponseCopyWith<$Res> {
  factory _$$GalleryItemResponseImplCopyWith(_$GalleryItemResponseImpl value,
          $Res Function(_$GalleryItemResponseImpl) then) =
      __$$GalleryItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String id,
      @JsonKey(name: "photos") List<Photo> photos,
      @JsonKey(name: "portrait") bool portrait,
      @JsonKey(name: "likes") Map<String, LikeDetail> likes,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "visitId") String visitId});
}

/// @nodoc
class __$$GalleryItemResponseImplCopyWithImpl<$Res>
    extends _$GalleryItemResponseCopyWithImpl<$Res, _$GalleryItemResponseImpl>
    implements _$$GalleryItemResponseImplCopyWith<$Res> {
  __$$GalleryItemResponseImplCopyWithImpl(_$GalleryItemResponseImpl _value,
      $Res Function(_$GalleryItemResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? photos = null,
    Object? portrait = null,
    Object? likes = null,
    Object? createdAt = null,
    Object? visitId = null,
  }) {
    return _then(_$GalleryItemResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>,
      portrait: null == portrait
          ? _value.portrait
          : portrait // ignore: cast_nullable_to_non_nullable
              as bool,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as Map<String, LikeDetail>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      visitId: null == visitId
          ? _value.visitId
          : visitId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GalleryItemResponseImpl implements _GalleryItemResponse {
  const _$GalleryItemResponseImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "photos") required final List<Photo> photos,
      @JsonKey(name: "portrait") required this.portrait,
      @JsonKey(name: "likes") required final Map<String, LikeDetail> likes,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "visitId") required this.visitId})
      : _photos = photos,
        _likes = likes;

  factory _$GalleryItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GalleryItemResponseImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String id;
  final List<Photo> _photos;
  @override
  @JsonKey(name: "photos")
  List<Photo> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  @JsonKey(name: "portrait")
  final bool portrait;
  final Map<String, LikeDetail> _likes;
  @override
  @JsonKey(name: "likes")
  Map<String, LikeDetail> get likes {
    if (_likes is EqualUnmodifiableMapView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_likes);
  }

  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @override
  @JsonKey(name: "visitId")
  final String visitId;

  @override
  String toString() {
    return 'GalleryItemResponse(id: $id, photos: $photos, portrait: $portrait, likes: $likes, createdAt: $createdAt, visitId: $visitId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryItemResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.portrait, portrait) ||
                other.portrait == portrait) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.visitId, visitId) || other.visitId == visitId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_photos),
      portrait,
      const DeepCollectionEquality().hash(_likes),
      createdAt,
      visitId);

  /// Create a copy of GalleryItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GalleryItemResponseImplCopyWith<_$GalleryItemResponseImpl> get copyWith =>
      __$$GalleryItemResponseImplCopyWithImpl<_$GalleryItemResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GalleryItemResponseImplToJson(
      this,
    );
  }
}

abstract class _GalleryItemResponse implements GalleryItemResponse {
  const factory _GalleryItemResponse(
          {@JsonKey(name: "id") required final String id,
          @JsonKey(name: "photos") required final List<Photo> photos,
          @JsonKey(name: "portrait") required final bool portrait,
          @JsonKey(name: "likes") required final Map<String, LikeDetail> likes,
          @JsonKey(name: "createdAt") required final DateTime createdAt,
          @JsonKey(name: "visitId") required final String visitId}) =
      _$GalleryItemResponseImpl;

  factory _GalleryItemResponse.fromJson(Map<String, dynamic> json) =
      _$GalleryItemResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String get id;
  @override
  @JsonKey(name: "photos")
  List<Photo> get photos;
  @override
  @JsonKey(name: "portrait")
  bool get portrait;
  @override
  @JsonKey(name: "likes")
  Map<String, LikeDetail> get likes;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  @JsonKey(name: "visitId")
  String get visitId;

  /// Create a copy of GalleryItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GalleryItemResponseImplCopyWith<_$GalleryItemResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return _Photo.fromJson(json);
}

/// @nodoc
mixin _$Photo {
  @JsonKey(name: "url")
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: "resolution")
  Resolution get resolution => throw _privateConstructorUsedError;

  /// Serializes this Photo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Photo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoCopyWith<Photo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoCopyWith<$Res> {
  factory $PhotoCopyWith(Photo value, $Res Function(Photo) then) =
      _$PhotoCopyWithImpl<$Res, Photo>;
  @useResult
  $Res call(
      {@JsonKey(name: "url") String url,
      @JsonKey(name: "resolution") Resolution resolution});

  $ResolutionCopyWith<$Res> get resolution;
}

/// @nodoc
class _$PhotoCopyWithImpl<$Res, $Val extends Photo>
    implements $PhotoCopyWith<$Res> {
  _$PhotoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Photo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? resolution = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      resolution: null == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as Resolution,
    ) as $Val);
  }

  /// Create a copy of Photo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResolutionCopyWith<$Res> get resolution {
    return $ResolutionCopyWith<$Res>(_value.resolution, (value) {
      return _then(_value.copyWith(resolution: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PhotoImplCopyWith<$Res> implements $PhotoCopyWith<$Res> {
  factory _$$PhotoImplCopyWith(
          _$PhotoImpl value, $Res Function(_$PhotoImpl) then) =
      __$$PhotoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "url") String url,
      @JsonKey(name: "resolution") Resolution resolution});

  @override
  $ResolutionCopyWith<$Res> get resolution;
}

/// @nodoc
class __$$PhotoImplCopyWithImpl<$Res>
    extends _$PhotoCopyWithImpl<$Res, _$PhotoImpl>
    implements _$$PhotoImplCopyWith<$Res> {
  __$$PhotoImplCopyWithImpl(
      _$PhotoImpl _value, $Res Function(_$PhotoImpl) _then)
      : super(_value, _then);

  /// Create a copy of Photo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? resolution = null,
  }) {
    return _then(_$PhotoImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      resolution: null == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as Resolution,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotoImpl implements _Photo {
  const _$PhotoImpl(
      {@JsonKey(name: "url") required this.url,
      @JsonKey(name: "resolution") required this.resolution});

  factory _$PhotoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoImplFromJson(json);

  @override
  @JsonKey(name: "url")
  final String url;
  @override
  @JsonKey(name: "resolution")
  final Resolution resolution;

  @override
  String toString() {
    return 'Photo(url: $url, resolution: $resolution)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, resolution);

  /// Create a copy of Photo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoImplCopyWith<_$PhotoImpl> get copyWith =>
      __$$PhotoImplCopyWithImpl<_$PhotoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoImplToJson(
      this,
    );
  }
}

abstract class _Photo implements Photo {
  const factory _Photo(
          {@JsonKey(name: "url") required final String url,
          @JsonKey(name: "resolution") required final Resolution resolution}) =
      _$PhotoImpl;

  factory _Photo.fromJson(Map<String, dynamic> json) = _$PhotoImpl.fromJson;

  @override
  @JsonKey(name: "url")
  String get url;
  @override
  @JsonKey(name: "resolution")
  Resolution get resolution;

  /// Create a copy of Photo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoImplCopyWith<_$PhotoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Resolution _$ResolutionFromJson(Map<String, dynamic> json) {
  return _Resolution.fromJson(json);
}

/// @nodoc
mixin _$Resolution {
  @JsonKey(name: "quality")
  int get quality => throw _privateConstructorUsedError;
  @JsonKey(name: "zoom")
  bool? get zoom => throw _privateConstructorUsedError;
  @JsonKey(name: "format")
  String get format => throw _privateConstructorUsedError;
  @JsonKey(name: "width")
  int? get width => throw _privateConstructorUsedError;
  @JsonKey(name: "height")
  int? get height => throw _privateConstructorUsedError;

  /// Serializes this Resolution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Resolution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResolutionCopyWith<Resolution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResolutionCopyWith<$Res> {
  factory $ResolutionCopyWith(
          Resolution value, $Res Function(Resolution) then) =
      _$ResolutionCopyWithImpl<$Res, Resolution>;
  @useResult
  $Res call(
      {@JsonKey(name: "quality") int quality,
      @JsonKey(name: "zoom") bool? zoom,
      @JsonKey(name: "format") String format,
      @JsonKey(name: "width") int? width,
      @JsonKey(name: "height") int? height});
}

/// @nodoc
class _$ResolutionCopyWithImpl<$Res, $Val extends Resolution>
    implements $ResolutionCopyWith<$Res> {
  _$ResolutionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Resolution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quality = null,
    Object? zoom = freezed,
    Object? format = null,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as int,
      zoom: freezed == zoom
          ? _value.zoom
          : zoom // ignore: cast_nullable_to_non_nullable
              as bool?,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResolutionImplCopyWith<$Res>
    implements $ResolutionCopyWith<$Res> {
  factory _$$ResolutionImplCopyWith(
          _$ResolutionImpl value, $Res Function(_$ResolutionImpl) then) =
      __$$ResolutionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "quality") int quality,
      @JsonKey(name: "zoom") bool? zoom,
      @JsonKey(name: "format") String format,
      @JsonKey(name: "width") int? width,
      @JsonKey(name: "height") int? height});
}

/// @nodoc
class __$$ResolutionImplCopyWithImpl<$Res>
    extends _$ResolutionCopyWithImpl<$Res, _$ResolutionImpl>
    implements _$$ResolutionImplCopyWith<$Res> {
  __$$ResolutionImplCopyWithImpl(
      _$ResolutionImpl _value, $Res Function(_$ResolutionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Resolution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quality = null,
    Object? zoom = freezed,
    Object? format = null,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_$ResolutionImpl(
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as int,
      zoom: freezed == zoom
          ? _value.zoom
          : zoom // ignore: cast_nullable_to_non_nullable
              as bool?,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResolutionImpl implements _Resolution {
  const _$ResolutionImpl(
      {@JsonKey(name: "quality") required this.quality,
      @JsonKey(name: "zoom") this.zoom,
      @JsonKey(name: "format") required this.format,
      @JsonKey(name: "width") this.width,
      @JsonKey(name: "height") this.height});

  factory _$ResolutionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResolutionImplFromJson(json);

  @override
  @JsonKey(name: "quality")
  final int quality;
  @override
  @JsonKey(name: "zoom")
  final bool? zoom;
  @override
  @JsonKey(name: "format")
  final String format;
  @override
  @JsonKey(name: "width")
  final int? width;
  @override
  @JsonKey(name: "height")
  final int? height;

  @override
  String toString() {
    return 'Resolution(quality: $quality, zoom: $zoom, format: $format, width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResolutionImpl &&
            (identical(other.quality, quality) || other.quality == quality) &&
            (identical(other.zoom, zoom) || other.zoom == zoom) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, quality, zoom, format, width, height);

  /// Create a copy of Resolution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResolutionImplCopyWith<_$ResolutionImpl> get copyWith =>
      __$$ResolutionImplCopyWithImpl<_$ResolutionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResolutionImplToJson(
      this,
    );
  }
}

abstract class _Resolution implements Resolution {
  const factory _Resolution(
      {@JsonKey(name: "quality") required final int quality,
      @JsonKey(name: "zoom") final bool? zoom,
      @JsonKey(name: "format") required final String format,
      @JsonKey(name: "width") final int? width,
      @JsonKey(name: "height") final int? height}) = _$ResolutionImpl;

  factory _Resolution.fromJson(Map<String, dynamic> json) =
      _$ResolutionImpl.fromJson;

  @override
  @JsonKey(name: "quality")
  int get quality;
  @override
  @JsonKey(name: "zoom")
  bool? get zoom;
  @override
  @JsonKey(name: "format")
  String get format;
  @override
  @JsonKey(name: "width")
  int? get width;
  @override
  @JsonKey(name: "height")
  int? get height;

  /// Create a copy of Resolution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResolutionImplCopyWith<_$ResolutionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LikeDetail _$LikeDetailFromJson(Map<String, dynamic> json) {
  return _LikeDetail.fromJson(json);
}

/// @nodoc
mixin _$LikeDetail {
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "likedAt")
  DateTime get likedAt => throw _privateConstructorUsedError;

  /// Serializes this LikeDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LikeDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LikeDetailCopyWith<LikeDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeDetailCopyWith<$Res> {
  factory $LikeDetailCopyWith(
          LikeDetail value, $Res Function(LikeDetail) then) =
      _$LikeDetailCopyWithImpl<$Res, LikeDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String name,
      @JsonKey(name: "likedAt") DateTime likedAt});
}

/// @nodoc
class _$LikeDetailCopyWithImpl<$Res, $Val extends LikeDetail>
    implements $LikeDetailCopyWith<$Res> {
  _$LikeDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LikeDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? likedAt = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      likedAt: null == likedAt
          ? _value.likedAt
          : likedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikeDetailImplCopyWith<$Res>
    implements $LikeDetailCopyWith<$Res> {
  factory _$$LikeDetailImplCopyWith(
          _$LikeDetailImpl value, $Res Function(_$LikeDetailImpl) then) =
      __$$LikeDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String name,
      @JsonKey(name: "likedAt") DateTime likedAt});
}

/// @nodoc
class __$$LikeDetailImplCopyWithImpl<$Res>
    extends _$LikeDetailCopyWithImpl<$Res, _$LikeDetailImpl>
    implements _$$LikeDetailImplCopyWith<$Res> {
  __$$LikeDetailImplCopyWithImpl(
      _$LikeDetailImpl _value, $Res Function(_$LikeDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of LikeDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? likedAt = null,
  }) {
    return _then(_$LikeDetailImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      likedAt: null == likedAt
          ? _value.likedAt
          : likedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LikeDetailImpl implements _LikeDetail {
  const _$LikeDetailImpl(
      {@JsonKey(name: "name") required this.name,
      @JsonKey(name: "likedAt") required this.likedAt});

  factory _$LikeDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$LikeDetailImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "likedAt")
  final DateTime likedAt;

  @override
  String toString() {
    return 'LikeDetail(name: $name, likedAt: $likedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeDetailImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.likedAt, likedAt) || other.likedAt == likedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, likedAt);

  /// Create a copy of LikeDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeDetailImplCopyWith<_$LikeDetailImpl> get copyWith =>
      __$$LikeDetailImplCopyWithImpl<_$LikeDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LikeDetailImplToJson(
      this,
    );
  }
}

abstract class _LikeDetail implements LikeDetail {
  const factory _LikeDetail(
          {@JsonKey(name: "name") required final String name,
          @JsonKey(name: "likedAt") required final DateTime likedAt}) =
      _$LikeDetailImpl;

  factory _LikeDetail.fromJson(Map<String, dynamic> json) =
      _$LikeDetailImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "likedAt")
  DateTime get likedAt;

  /// Create a copy of LikeDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikeDetailImplCopyWith<_$LikeDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
