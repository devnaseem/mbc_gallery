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
  DateTime get date => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  dynamic get required => throw _privateConstructorUsedError;

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
  $Res call({DateTime date, List<String> images, dynamic required});
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
    Object? date = null,
    Object? images = null,
    Object? required = freezed,
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
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
  $Res call({DateTime date, List<String> images, dynamic required});
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
    Object? date = null,
    Object? images = null,
    Object? required = freezed,
  }) {
    return _then(_$GalleryItemModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      required: freezed == required ? _value.required! : required,
    ));
  }
}

/// @nodoc

class _$GalleryItemModelImpl implements _GalleryItemModel {
  const _$GalleryItemModelImpl(
      {required this.date, required final List<String> images, this.required})
      : _images = images;

  @override
  final DateTime date;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final dynamic required;

  @override
  String toString() {
    return 'GalleryItemModel(date: $date, images: $images, required: $required)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryItemModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other.required, required));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(required));

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
      {required final DateTime date,
      required final List<String> images,
      final dynamic required}) = _$GalleryItemModelImpl;

  @override
  DateTime get date;
  @override
  List<String> get images;
  @override
  dynamic get required;

  /// Create a copy of GalleryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GalleryItemModelImplCopyWith<_$GalleryItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
