import 'package:mbc_common/mbc_common.dart';
import 'package:mbc_gallery/data/repository/gallery_repository_impl.dart';
import 'package:mbc_gallery/data/repository/igallery_repository.dart';
import 'package:mbc_gallery/domain/model/gallery_item_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'get_gallery_images_use_case.g.dart';

@Riverpod(keepAlive: true)
GetGalleryImagesUseCase getGalleryImagesUseCase(GetGalleryImagesUseCaseRef ref) {
  final galleryRepository = ref.watch(galleryRepositoryImplProvider);
  return GetGalleryImagesUseCase(galleryRepository);
}

class GetGalleryImagesUseCase {
  final IGalleryRepository _galleryRepository;

  const GetGalleryImagesUseCase(this._galleryRepository);

  Future<Result<List<GalleryItemModel>, Failure>> call(String psId, int page) async {
    try {
      final galleryList = await _galleryRepository.getGalleryImages( psId, page);
      return Success(galleryList);
    } catch (error, stackTrace) {
      return Error(Failure(
        message: error.toString(),
        stackTrace: stackTrace,
      ));
    }
  }
}
