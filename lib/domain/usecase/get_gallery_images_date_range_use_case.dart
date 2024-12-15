import 'package:mbc_common/mbc_common.dart';
import 'package:mbc_gallery/data/repository/gallery_repository_impl.dart';
import 'package:mbc_gallery/data/repository/igallery_repository.dart';
import 'package:mbc_gallery/domain/model/gallery_item_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'get_gallery_images_date_range_use_case.g.dart';

@Riverpod(keepAlive: true)
GetGalleryImagesDateRangeUseCase getGalleryImagesDateRangeUseCase(
    GetGalleryImagesDateRangeUseCaseRef ref) {
  final galleryRepository = ref.watch(galleryRepositoryImplProvider);
  return GetGalleryImagesDateRangeUseCase(galleryRepository);
}

class GetGalleryImagesDateRangeUseCase {
  final IGalleryRepository _galleryRepository;

  const GetGalleryImagesDateRangeUseCase(this._galleryRepository);

  Future<Result<List<GalleryItemModel>, Failure>> call(
      String psId, int page, String startDate, String endDate) async {
    try {
      final galleryList = await _galleryRepository.getGalleryImagesForDateRange(
          psId, page, startDate, endDate);
      return Success(galleryList);
    } catch (error, stackTrace) {
      return Error(Failure(
        message: error.toString(),
        stackTrace: stackTrace,
      ));
    }
  }
}
