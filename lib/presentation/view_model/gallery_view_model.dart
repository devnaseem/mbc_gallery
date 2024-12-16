import 'package:mbc_gallery/domain/model/gallery_item_model.dart';
import 'package:mbc_gallery/domain/usecase/get_gallery_images_date_range_use_case.dart';
import 'package:mbc_gallery/domain/usecase/get_gallery_images_use_case.dart';
import 'package:mbc_gallery/presentation/state/gallery_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:intl/intl.dart';

part 'gallery_view_model.g.dart';

@riverpod
class GalleryViewModel extends _$GalleryViewModel {
  @override
  GalleryState build() {
    return GalleryState.initial();
  }

  void getGalleryImages(String psId,
      {int page = 1, bool shouldLoadCustomDateRangePhotos = false}) async {
    if (state.isLoadingMore) return;
    if (!state.shouldLoadMore && page != 1) return; // No more pages to load

    if (page == 1) {
      // Initial load
      state = state.copyWith(
        galleryList: const AsyncLoading(),
      );
    } else {
      // Loading more data
      state = state.copyWith(isLoadingMore: true);
    }

    final startDateString = DateFormat('yyyy-MM-dd').format(state.startDate!);
    final endDateString = DateFormat('yyyy-MM-dd').format(state.endDate!);

    final galleryResult = await (shouldLoadCustomDateRangePhotos
        ? ref
            .read(getGalleryImagesDateRangeUseCaseProvider)
            .call(psId, page, startDateString, endDateString)
        : ref.read(getGalleryImagesUseCaseProvider).call(psId, page));

    galleryResult.when((List<GalleryItemModel> galleryResponseList) {
      final List<GalleryItemModel> newGalleryList = page == 1
          ? galleryResponseList
          : [...state.galleryList.value ?? [], ...galleryResponseList];

      state = state.copyWith(
          galleryList: AsyncValue.data(newGalleryList),
          currentPage: page,
          isLoadingMore: false,
          shouldLoadMore: galleryResponseList.isNotEmpty);
    }, (error) {
      state = state.copyWith(
        currentPage: page,
        galleryList: AsyncError(error, error.stackTrace),
        isLoadingMore: false,
      );
    });
  }

  void updateGallerySettings(
      String psId, DateFilter filter, DateTime startDate, DateTime endDate) {
    state = state.copyWith(
      selectedFilter: filter,
      startDate: startDate,
      endDate: endDate,
    );

    getGalleryImages(psId,
        page: 1,
        shouldLoadCustomDateRangePhotos:
            state.selectedFilter == DateFilter.customDate);
  }

  void resetFilters(systemId) {
    state = state.copyWith(
      selectedFilter: DateFilter.allTime,
      startDate: DateTime.now().subtract(const Duration(days: 365)),
      endDate: DateTime.now(),
    );
    getGalleryImages(systemId, page: 1, shouldLoadCustomDateRangePhotos: false);
  }
}
