import 'package:mbc_gallery/domain/model/gallery_item_model.dart';
import 'package:mbc_gallery/domain/usecase/get_gallery_images_use_case.dart';
import 'package:mbc_gallery/presentation/state/gallery_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gallery_view_model.g.dart';

@riverpod
class GalleryViewModel extends _$GalleryViewModel {
  @override
  GalleryState build() {
    return const GalleryState();
  }

  void getGalleryImages(String psId,{int page = 1}) async {
    if (state.isLoadingMore) return;
    if (!state.shouldLoadMore) return; // No more pages to load

    if (page == 1) {
      // Initial load
      state = state.copyWith(
        galleryList: const AsyncLoading(),
      );
    } else {
      // Loading more data
      state = state.copyWith(isLoadingMore: true);
    }

    final galleryResult = await ref
        .read(getGalleryImagesUseCaseProvider)
        .call(psId,page);

    galleryResult.when((List<GalleryItemModel> galleryResponseList) {
      final List<GalleryItemModel> newGalleryList = page == 1
          ? galleryResponseList
          : [...state.galleryList.value ?? [], ...galleryResponseList];

      state = state.copyWith(
        galleryList: AsyncValue.data(newGalleryList),
        currentPage: page,
        isLoadingMore: false,
        shouldLoadMore: galleryResponseList.isNotEmpty
      );
    }, (error) {
      state = state.copyWith(
        currentPage: page,
        galleryList: AsyncError(error, error.stackTrace),
        isLoadingMore: false,
      );
    });
  }
}
