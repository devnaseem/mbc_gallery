// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GalleryState {
  AsyncValue<List<GalleryItemModel>> get galleryList =>
      throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  bool get shouldLoadMore => throw _privateConstructorUsedError;
  DateFilter get selectedFilter => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String get psId => throw _privateConstructorUsedError;
  String get cognitoId => throw _privateConstructorUsedError;

  /// Create a copy of GalleryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GalleryStateCopyWith<GalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryStateCopyWith<$Res> {
  factory $GalleryStateCopyWith(
          GalleryState value, $Res Function(GalleryState) then) =
      _$GalleryStateCopyWithImpl<$Res, GalleryState>;
  @useResult
  $Res call(
      {AsyncValue<List<GalleryItemModel>> galleryList,
      int currentPage,
      bool isLoadingMore,
      bool shouldLoadMore,
      DateFilter selectedFilter,
      DateTime? startDate,
      DateTime? endDate,
      String psId,
      String cognitoId});
}

/// @nodoc
class _$GalleryStateCopyWithImpl<$Res, $Val extends GalleryState>
    implements $GalleryStateCopyWith<$Res> {
  _$GalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GalleryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? galleryList = null,
    Object? currentPage = null,
    Object? isLoadingMore = null,
    Object? shouldLoadMore = null,
    Object? selectedFilter = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? psId = null,
    Object? cognitoId = null,
  }) {
    return _then(_value.copyWith(
      galleryList: null == galleryList
          ? _value.galleryList
          : galleryList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<GalleryItemModel>>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldLoadMore: null == shouldLoadMore
          ? _value.shouldLoadMore
          : shouldLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedFilter: null == selectedFilter
          ? _value.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as DateFilter,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      psId: null == psId
          ? _value.psId
          : psId // ignore: cast_nullable_to_non_nullable
              as String,
      cognitoId: null == cognitoId
          ? _value.cognitoId
          : cognitoId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GalleryStateImplCopyWith<$Res>
    implements $GalleryStateCopyWith<$Res> {
  factory _$$GalleryStateImplCopyWith(
          _$GalleryStateImpl value, $Res Function(_$GalleryStateImpl) then) =
      __$$GalleryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<GalleryItemModel>> galleryList,
      int currentPage,
      bool isLoadingMore,
      bool shouldLoadMore,
      DateFilter selectedFilter,
      DateTime? startDate,
      DateTime? endDate,
      String psId,
      String cognitoId});
}

/// @nodoc
class __$$GalleryStateImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$GalleryStateImpl>
    implements _$$GalleryStateImplCopyWith<$Res> {
  __$$GalleryStateImplCopyWithImpl(
      _$GalleryStateImpl _value, $Res Function(_$GalleryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? galleryList = null,
    Object? currentPage = null,
    Object? isLoadingMore = null,
    Object? shouldLoadMore = null,
    Object? selectedFilter = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? psId = null,
    Object? cognitoId = null,
  }) {
    return _then(_$GalleryStateImpl(
      galleryList: null == galleryList
          ? _value.galleryList
          : galleryList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<GalleryItemModel>>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldLoadMore: null == shouldLoadMore
          ? _value.shouldLoadMore
          : shouldLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedFilter: null == selectedFilter
          ? _value.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as DateFilter,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      psId: null == psId
          ? _value.psId
          : psId // ignore: cast_nullable_to_non_nullable
              as String,
      cognitoId: null == cognitoId
          ? _value.cognitoId
          : cognitoId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GalleryStateImpl implements _GalleryState {
  const _$GalleryStateImpl(
      {this.galleryList = const AsyncLoading(),
      this.currentPage = 1,
      this.isLoadingMore = false,
      this.shouldLoadMore = true,
      this.selectedFilter = DateFilter.allTime,
      this.startDate,
      this.endDate,
      this.psId = "",
      this.cognitoId = ""});

  @override
  @JsonKey()
  final AsyncValue<List<GalleryItemModel>> galleryList;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  @JsonKey()
  final bool shouldLoadMore;
  @override
  @JsonKey()
  final DateFilter selectedFilter;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  @JsonKey()
  final String psId;
  @override
  @JsonKey()
  final String cognitoId;

  @override
  String toString() {
    return 'GalleryState(galleryList: $galleryList, currentPage: $currentPage, isLoadingMore: $isLoadingMore, shouldLoadMore: $shouldLoadMore, selectedFilter: $selectedFilter, startDate: $startDate, endDate: $endDate, psId: $psId, cognitoId: $cognitoId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryStateImpl &&
            (identical(other.galleryList, galleryList) ||
                other.galleryList == galleryList) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.shouldLoadMore, shouldLoadMore) ||
                other.shouldLoadMore == shouldLoadMore) &&
            (identical(other.selectedFilter, selectedFilter) ||
                other.selectedFilter == selectedFilter) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.psId, psId) || other.psId == psId) &&
            (identical(other.cognitoId, cognitoId) ||
                other.cognitoId == cognitoId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      galleryList,
      currentPage,
      isLoadingMore,
      shouldLoadMore,
      selectedFilter,
      startDate,
      endDate,
      psId,
      cognitoId);

  /// Create a copy of GalleryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GalleryStateImplCopyWith<_$GalleryStateImpl> get copyWith =>
      __$$GalleryStateImplCopyWithImpl<_$GalleryStateImpl>(this, _$identity);
}

abstract class _GalleryState implements GalleryState {
  const factory _GalleryState(
      {final AsyncValue<List<GalleryItemModel>> galleryList,
      final int currentPage,
      final bool isLoadingMore,
      final bool shouldLoadMore,
      final DateFilter selectedFilter,
      final DateTime? startDate,
      final DateTime? endDate,
      final String psId,
      final String cognitoId}) = _$GalleryStateImpl;

  @override
  AsyncValue<List<GalleryItemModel>> get galleryList;
  @override
  int get currentPage;
  @override
  bool get isLoadingMore;
  @override
  bool get shouldLoadMore;
  @override
  DateFilter get selectedFilter;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  String get psId;
  @override
  String get cognitoId;

  /// Create a copy of GalleryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GalleryStateImplCopyWith<_$GalleryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
