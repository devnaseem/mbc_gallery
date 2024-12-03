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
  @JsonKey(name: "galleryWithDate")
  List<GalleryWithDate> get galleryWithDate =>
      throw _privateConstructorUsedError;

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
  $Res call(
      {@JsonKey(name: "galleryWithDate")
      List<GalleryWithDate> galleryWithDate});
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
    Object? galleryWithDate = null,
  }) {
    return _then(_value.copyWith(
      galleryWithDate: null == galleryWithDate
          ? _value.galleryWithDate
          : galleryWithDate // ignore: cast_nullable_to_non_nullable
              as List<GalleryWithDate>,
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
  $Res call(
      {@JsonKey(name: "galleryWithDate")
      List<GalleryWithDate> galleryWithDate});
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
    Object? galleryWithDate = null,
  }) {
    return _then(_$GalleryListResponseImpl(
      galleryWithDate: null == galleryWithDate
          ? _value._galleryWithDate
          : galleryWithDate // ignore: cast_nullable_to_non_nullable
              as List<GalleryWithDate>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GalleryListResponseImpl implements _GalleryListResponse {
  const _$GalleryListResponseImpl(
      {@JsonKey(name: "galleryWithDate")
      required final List<GalleryWithDate> galleryWithDate})
      : _galleryWithDate = galleryWithDate;

  factory _$GalleryListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GalleryListResponseImplFromJson(json);

  final List<GalleryWithDate> _galleryWithDate;
  @override
  @JsonKey(name: "galleryWithDate")
  List<GalleryWithDate> get galleryWithDate {
    if (_galleryWithDate is EqualUnmodifiableListView) return _galleryWithDate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_galleryWithDate);
  }

  @override
  String toString() {
    return 'GalleryListResponse(galleryWithDate: $galleryWithDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryListResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._galleryWithDate, _galleryWithDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_galleryWithDate));

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
          {@JsonKey(name: "galleryWithDate")
          required final List<GalleryWithDate> galleryWithDate}) =
      _$GalleryListResponseImpl;

  factory _GalleryListResponse.fromJson(Map<String, dynamic> json) =
      _$GalleryListResponseImpl.fromJson;

  @override
  @JsonKey(name: "galleryWithDate")
  List<GalleryWithDate> get galleryWithDate;

  /// Create a copy of GalleryListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GalleryListResponseImplCopyWith<_$GalleryListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GalleryWithDate _$GalleryWithDateFromJson(Map<String, dynamic> json) {
  return _GalleryWithDate.fromJson(json);
}

/// @nodoc
mixin _$GalleryWithDate {
  @JsonKey(name: "date")
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: "images")
  List<String> get images => throw _privateConstructorUsedError;

  /// Serializes this GalleryWithDate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GalleryWithDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GalleryWithDateCopyWith<GalleryWithDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryWithDateCopyWith<$Res> {
  factory $GalleryWithDateCopyWith(
          GalleryWithDate value, $Res Function(GalleryWithDate) then) =
      _$GalleryWithDateCopyWithImpl<$Res, GalleryWithDate>;
  @useResult
  $Res call(
      {@JsonKey(name: "date") DateTime date,
      @JsonKey(name: "images") List<String> images});
}

/// @nodoc
class _$GalleryWithDateCopyWithImpl<$Res, $Val extends GalleryWithDate>
    implements $GalleryWithDateCopyWith<$Res> {
  _$GalleryWithDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GalleryWithDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GalleryWithDateImplCopyWith<$Res>
    implements $GalleryWithDateCopyWith<$Res> {
  factory _$$GalleryWithDateImplCopyWith(_$GalleryWithDateImpl value,
          $Res Function(_$GalleryWithDateImpl) then) =
      __$$GalleryWithDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "date") DateTime date,
      @JsonKey(name: "images") List<String> images});
}

/// @nodoc
class __$$GalleryWithDateImplCopyWithImpl<$Res>
    extends _$GalleryWithDateCopyWithImpl<$Res, _$GalleryWithDateImpl>
    implements _$$GalleryWithDateImplCopyWith<$Res> {
  __$$GalleryWithDateImplCopyWithImpl(
      _$GalleryWithDateImpl _value, $Res Function(_$GalleryWithDateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryWithDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? images = null,
  }) {
    return _then(_$GalleryWithDateImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GalleryWithDateImpl implements _GalleryWithDate {
  const _$GalleryWithDateImpl(
      {@JsonKey(name: "date") required this.date,
      @JsonKey(name: "images") required final List<String> images})
      : _images = images;

  factory _$GalleryWithDateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GalleryWithDateImplFromJson(json);

  @override
  @JsonKey(name: "date")
  final DateTime date;
  final List<String> _images;
  @override
  @JsonKey(name: "images")
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'GalleryWithDate(date: $date, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryWithDateImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_images));

  /// Create a copy of GalleryWithDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GalleryWithDateImplCopyWith<_$GalleryWithDateImpl> get copyWith =>
      __$$GalleryWithDateImplCopyWithImpl<_$GalleryWithDateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GalleryWithDateImplToJson(
      this,
    );
  }
}

abstract class _GalleryWithDate implements GalleryWithDate {
  const factory _GalleryWithDate(
          {@JsonKey(name: "date") required final DateTime date,
          @JsonKey(name: "images") required final List<String> images}) =
      _$GalleryWithDateImpl;

  factory _GalleryWithDate.fromJson(Map<String, dynamic> json) =
      _$GalleryWithDateImpl.fromJson;

  @override
  @JsonKey(name: "date")
  DateTime get date;
  @override
  @JsonKey(name: "images")
  List<String> get images;

  /// Create a copy of GalleryWithDate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GalleryWithDateImplCopyWith<_$GalleryWithDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
