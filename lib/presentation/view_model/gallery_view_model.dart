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

  void getGalleryImages() async {
    state = state.copyWith(
      galleryList: const AsyncLoading(),
    );

    final galleryResult = await ref
        .read(getGalleryImagesUseCaseProvider)
        .call();

    galleryResult.when((gallery) {
      state = state.copyWith(
        galleryList: AsyncValue.data(gallery),
      );
    }, (error) {

      state = state.copyWith(
        galleryList: AsyncError(error, error.stackTrace),
      );
    });
  }
}
