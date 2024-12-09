// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GalleryItemModel {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get visitId => throw _privateConstructorUsedError;
  List<PhotoModel> get photos => throw _privateConstructorUsedError;
  Map<String, LikeDetailModel> get likes => throw _privateConstructorUsedError;

  /// Create a copy of GalleryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GalleryItemModelCopyWith<GalleryItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryItemModelCopyWith<$Res> {
  factory $GalleryItemModelCopyWith(
          GalleryItemModel value, $Res Function(GalleryItemModel) then) =
      _$GalleryItemModelCopyWithImpl<$Res, GalleryItemModel>;
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      String visitId,
      List<PhotoModel> photos,
      Map<String, LikeDetailModel> likes});
}

/// @nodoc
class _$GalleryItemModelCopyWithImpl<$Res, $Val extends GalleryItemModel>
    implements $GalleryItemModelCopyWith<$Res> {
  _$GalleryItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GalleryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? visitId = null,
    Object? photos = null,
    Object? likes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      visitId: null == visitId
          ? _value.visitId
          : visitId // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoModel>,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as Map<String, LikeDetailModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GalleryItemModelImplCopyWith<$Res>
    implements $GalleryItemModelCopyWith<$Res> {
  factory _$$GalleryItemModelImplCopyWith(_$GalleryItemModelImpl value,
          $Res Function(_$GalleryItemModelImpl) then) =
      __$$GalleryItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      String visitId,
      List<PhotoModel> photos,
      Map<String, LikeDetailModel> likes});
}

/// @nodoc
class __$$GalleryItemModelImplCopyWithImpl<$Res>
    extends _$GalleryItemModelCopyWithImpl<$Res, _$GalleryItemModelImpl>
    implements _$$GalleryItemModelImplCopyWith<$Res> {
  __$$GalleryItemModelImplCopyWithImpl(_$GalleryItemModelImpl _value,
      $Res Function(_$GalleryItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? visitId = null,
    Object? photos = null,
    Object? likes = null,
  }) {
    return _then(_$GalleryItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      visitId: null == visitId
          ? _value.visitId
          : visitId // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoModel>,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as Map<String, LikeDetailModel>,
    ));
  }
}

/// @nodoc

class _$GalleryItemModelImpl implements _GalleryItemModel {
  const _$GalleryItemModelImpl(
      {required this.id,
      required this.createdAt,
      required this.visitId,
      required final List<PhotoModel> photos,
      required final Map<String, LikeDetailModel> likes})
      : _photos = photos,
        _likes = likes;

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final String visitId;
  final List<PhotoModel> _photos;
  @override
  List<PhotoModel> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  final Map<String, LikeDetailModel> _likes;
  @override
  Map<String, LikeDetailModel> get likes {
    if (_likes is EqualUnmodifiableMapView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_likes);
  }

  @override
  String toString() {
    return 'GalleryItemModel(id: $id, createdAt: $createdAt, visitId: $visitId, photos: $photos, likes: $likes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.visitId, visitId) || other.visitId == visitId) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            const DeepCollectionEquality().equals(other._likes, _likes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      visitId,
      const DeepCollectionEquality().hash(_photos),
      const DeepCollectionEquality().hash(_likes));

  /// Create a copy of GalleryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GalleryItemModelImplCopyWith<_$GalleryItemModelImpl> get copyWith =>
      __$$GalleryItemModelImplCopyWithImpl<_$GalleryItemModelImpl>(
          this, _$identity);
}

abstract class _GalleryItemModel implements GalleryItemModel {
  const factory _GalleryItemModel(
          {required final String id,
          required final DateTime createdAt,
          required final String visitId,
          required final List<PhotoModel> photos,
          required final Map<String, LikeDetailModel> likes}) =
      _$GalleryItemModelImpl;

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  String get visitId;
  @override
  List<PhotoModel> get photos;
  @override
  Map<String, LikeDetailModel> get likes;

  /// Create a copy of GalleryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GalleryItemModelImplCopyWith<_$GalleryItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PhotoModel {
  String get url => throw _privateConstructorUsedError;
  ResolutionModel get resolution => throw _privateConstructorUsedError;

  /// Create a copy of PhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoModelCopyWith<PhotoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoModelCopyWith<$Res> {
  factory $PhotoModelCopyWith(
          PhotoModel value, $Res Function(PhotoModel) then) =
      _$PhotoModelCopyWithImpl<$Res, PhotoModel>;
  @useResult
  $Res call({String url, ResolutionModel resolution});

  $ResolutionModelCopyWith<$Res> get resolution;
}

/// @nodoc
class _$PhotoModelCopyWithImpl<$Res, $Val extends PhotoModel>
    implements $PhotoModelCopyWith<$Res> {
  _$PhotoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoModel
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
              as ResolutionModel,
    ) as $Val);
  }

  /// Create a copy of PhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResolutionModelCopyWith<$Res> get resolution {
    return $ResolutionModelCopyWith<$Res>(_value.resolution, (value) {
      return _then(_value.copyWith(resolution: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PhotoModelImplCopyWith<$Res>
    implements $PhotoModelCopyWith<$Res> {
  factory _$$PhotoModelImplCopyWith(
          _$PhotoModelImpl value, $Res Function(_$PhotoModelImpl) then) =
      __$$PhotoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, ResolutionModel resolution});

  @override
  $ResolutionModelCopyWith<$Res> get resolution;
}

/// @nodoc
class __$$PhotoModelImplCopyWithImpl<$Res>
    extends _$PhotoModelCopyWithImpl<$Res, _$PhotoModelImpl>
    implements _$$PhotoModelImplCopyWith<$Res> {
  __$$PhotoModelImplCopyWithImpl(
      _$PhotoModelImpl _value, $Res Function(_$PhotoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? resolution = null,
  }) {
    return _then(_$PhotoModelImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      resolution: null == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as ResolutionModel,
    ));
  }
}

/// @nodoc

class _$PhotoModelImpl implements _PhotoModel {
  const _$PhotoModelImpl({required this.url, required this.resolution});

  @override
  final String url;
  @override
  final ResolutionModel resolution;

  @override
  String toString() {
    return 'PhotoModel(url: $url, resolution: $resolution)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoModelImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, resolution);

  /// Create a copy of PhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoModelImplCopyWith<_$PhotoModelImpl> get copyWith =>
      __$$PhotoModelImplCopyWithImpl<_$PhotoModelImpl>(this, _$identity);
}

abstract class _PhotoModel implements PhotoModel {
  const factory _PhotoModel(
      {required final String url,
      required final ResolutionModel resolution}) = _$PhotoModelImpl;

  @override
  String get url;
  @override
  ResolutionModel get resolution;

  /// Create a copy of PhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoModelImplCopyWith<_$PhotoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ResolutionModel {
  int get quality => throw _privateConstructorUsedError;
  bool? get zoom => throw _privateConstructorUsedError;
  String get format => throw _privateConstructorUsedError;
  int? get width => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;

  /// Create a copy of ResolutionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResolutionModelCopyWith<ResolutionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResolutionModelCopyWith<$Res> {
  factory $ResolutionModelCopyWith(
          ResolutionModel value, $Res Function(ResolutionModel) then) =
      _$ResolutionModelCopyWithImpl<$Res, ResolutionModel>;
  @useResult
  $Res call({int quality, bool? zoom, String format, int? width, int? height});
}

/// @nodoc
class _$ResolutionModelCopyWithImpl<$Res, $Val extends ResolutionModel>
    implements $ResolutionModelCopyWith<$Res> {
  _$ResolutionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResolutionModel
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
abstract class _$$ResolutionModelImplCopyWith<$Res>
    implements $ResolutionModelCopyWith<$Res> {
  factory _$$ResolutionModelImplCopyWith(_$ResolutionModelImpl value,
          $Res Function(_$ResolutionModelImpl) then) =
      __$$ResolutionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int quality, bool? zoom, String format, int? width, int? height});
}

/// @nodoc
class __$$ResolutionModelImplCopyWithImpl<$Res>
    extends _$ResolutionModelCopyWithImpl<$Res, _$ResolutionModelImpl>
    implements _$$ResolutionModelImplCopyWith<$Res> {
  __$$ResolutionModelImplCopyWithImpl(
      _$ResolutionModelImpl _value, $Res Function(_$ResolutionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResolutionModel
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
    return _then(_$ResolutionModelImpl(
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

class _$ResolutionModelImpl implements _ResolutionModel {
  const _$ResolutionModelImpl(
      {required this.quality,
      this.zoom,
      required this.format,
      this.width,
      this.height});

  @override
  final int quality;
  @override
  final bool? zoom;
  @override
  final String format;
  @override
  final int? width;
  @override
  final int? height;

  @override
  String toString() {
    return 'ResolutionModel(quality: $quality, zoom: $zoom, format: $format, width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResolutionModelImpl &&
            (identical(other.quality, quality) || other.quality == quality) &&
            (identical(other.zoom, zoom) || other.zoom == zoom) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, quality, zoom, format, width, height);

  /// Create a copy of ResolutionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResolutionModelImplCopyWith<_$ResolutionModelImpl> get copyWith =>
      __$$ResolutionModelImplCopyWithImpl<_$ResolutionModelImpl>(
          this, _$identity);
}

abstract class _ResolutionModel implements ResolutionModel {
  const factory _ResolutionModel(
      {required final int quality,
      final bool? zoom,
      required final String format,
      final int? width,
      final int? height}) = _$ResolutionModelImpl;

  @override
  int get quality;
  @override
  bool? get zoom;
  @override
  String get format;
  @override
  int? get width;
  @override
  int? get height;

  /// Create a copy of ResolutionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResolutionModelImplCopyWith<_$ResolutionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LikeDetailModel {
  DateTime get likeAt => throw _privateConstructorUsedError;

  /// Create a copy of LikeDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LikeDetailModelCopyWith<LikeDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeDetailModelCopyWith<$Res> {
  factory $LikeDetailModelCopyWith(
          LikeDetailModel value, $Res Function(LikeDetailModel) then) =
      _$LikeDetailModelCopyWithImpl<$Res, LikeDetailModel>;
  @useResult
  $Res call({DateTime likeAt});
}

/// @nodoc
class _$LikeDetailModelCopyWithImpl<$Res, $Val extends LikeDetailModel>
    implements $LikeDetailModelCopyWith<$Res> {
  _$LikeDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LikeDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likeAt = null,
  }) {
    return _then(_value.copyWith(
      likeAt: null == likeAt
          ? _value.likeAt
          : likeAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikeDetailModelImplCopyWith<$Res>
    implements $LikeDetailModelCopyWith<$Res> {
  factory _$$LikeDetailModelImplCopyWith(_$LikeDetailModelImpl value,
          $Res Function(_$LikeDetailModelImpl) then) =
      __$$LikeDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime likeAt});
}

/// @nodoc
class __$$LikeDetailModelImplCopyWithImpl<$Res>
    extends _$LikeDetailModelCopyWithImpl<$Res, _$LikeDetailModelImpl>
    implements _$$LikeDetailModelImplCopyWith<$Res> {
  __$$LikeDetailModelImplCopyWithImpl(
      _$LikeDetailModelImpl _value, $Res Function(_$LikeDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LikeDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likeAt = null,
  }) {
    return _then(_$LikeDetailModelImpl(
      likeAt: null == likeAt
          ? _value.likeAt
          : likeAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$LikeDetailModelImpl implements _LikeDetailModel {
  const _$LikeDetailModelImpl({required this.likeAt});

  @override
  final DateTime likeAt;

  @override
  String toString() {
    return 'LikeDetailModel(likeAt: $likeAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeDetailModelImpl &&
            (identical(other.likeAt, likeAt) || other.likeAt == likeAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, likeAt);

  /// Create a copy of LikeDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeDetailModelImplCopyWith<_$LikeDetailModelImpl> get copyWith =>
      __$$LikeDetailModelImplCopyWithImpl<_$LikeDetailModelImpl>(
          this, _$identity);
}

abstract class _LikeDetailModel implements LikeDetailModel {
  const factory _LikeDetailModel({required final DateTime likeAt}) =
      _$LikeDetailModelImpl;

  @override
  DateTime get likeAt;

  /// Create a copy of LikeDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikeDetailModelImplCopyWith<_$LikeDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
