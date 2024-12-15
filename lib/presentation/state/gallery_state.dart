import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mbc_gallery/domain/model/gallery_item_model.dart';

part 'gallery_state.freezed.dart';

@freezed
abstract class GalleryState with _$GalleryState {
  const factory GalleryState({
    @Default(AsyncLoading()) AsyncValue<List<GalleryItemModel>> galleryList,
    @Default(1) int currentPage,
    @Default(false) bool isLoadingMore,
    @Default(true) bool shouldLoadMore,
    @Default(DateFilter.allTime) DateFilter selectedFilter,
    DateTime? startDate,
    DateTime? endDate,
  }) = _GalleryState;

  factory GalleryState.initial() => GalleryState(
        startDate: DateTime.now().subtract(Duration(days: 365)),
        endDate: DateTime.now(),
      );
}

enum DateFilter {
  allTime("All Time"),
  customDate("Custom Date");

  final String? value;
  const DateFilter([this.value]);

  static DateFilter fromString(String filterType) {
    return DateFilter.values.firstWhere(
      (e) => e.value == filterType,
      orElse: () => DateFilter.allTime,
    );
  }
}
