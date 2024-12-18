import 'package:mbc_common/mbc_common.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mbc_gallery/data/repository/gallery_repository_impl.dart';
import 'package:mbc_gallery/data/repository/igallery_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_photo_status_use_case.g.dart';

@Riverpod(keepAlive: true)
UpdatePhotoStatusUseCase updatePhotoStatusUseCase(
    UpdatePhotoStatusUseCaseRef ref) {
  final galleryRepository = ref.watch(galleryRepositoryImplProvider);
  return UpdatePhotoStatusUseCase(galleryRepository);
}

class UpdatePhotoStatusUseCase {
  final IGalleryRepository _galleryRepository;

  const UpdatePhotoStatusUseCase(this._galleryRepository);

  Future<Result<void, Failure>> call(
      String psId, String photoId, String action) async {
    try {
      await _galleryRepository.updatePhotoStatus(psId, photoId, action);
      return Success(null);
    } catch (error, stackTrace) {
      return Error(Failure(
        message: error.toString(),
        stackTrace: stackTrace,
      ));
    }
  }
}
