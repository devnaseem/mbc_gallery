import 'package:mbc_common/mbc_common.dart';
import 'package:mbc_gallery/data/api/gallery_api.dart';
import 'package:mbc_gallery/data/dto/gallery_list_response.dart';
import 'package:mbc_gallery/data/repository/igallery_repository.dart';
import 'package:mbc_gallery/domain/mappers/gallery_mapper.dart';
import 'package:mbc_gallery/domain/model/gallery_item_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart';
part 'gallery_repository_impl.g.dart';

@Riverpod(keepAlive: true)
GalleryRepositoryImpl galleryRepositoryImpl(GalleryRepositoryImplRef ref) {
  final galleryApiService = ref.watch(galleryApiProvider);
  final mapper = ref.watch(galleryMapperProvider); // Inject mapper here
  return GalleryRepositoryImpl(galleryApiService, mapper);
}

class GalleryRepositoryImpl
    with DioExceptionMixin
    implements IGalleryRepository {
  final GalleryApi _galleryApiService;
  final GalleryMapper _mapper;

  GalleryRepositoryImpl(this._galleryApiService, this._mapper);

  @override
  Future<List<GalleryItemModel>> getGalleryImages(String psId, int page) async {
    final galleryListResponse = await callApi<List<GalleryItemResponse>>(
      () => _galleryApiService.getGalleryPhotos(page, psId),
    );

    final galleryList = compute(
      _mapper.toDomain,
      galleryListResponse,
    );
    return galleryList;
  }

  @override
  Future<List<GalleryItemModel>> getGalleryImagesForDateRange(
      String psId, int page, String startDate, String endDate) async {
    final galleryListResponse = await callApi<List<GalleryItemResponse>>(
      () => _galleryApiService.getGalleryPhotosForDateRange(
          page, psId, startDate, endDate),
    );

    final galleryList = compute(
      _mapper.toDomain,
      galleryListResponse,
    );
    return galleryList;
  }

  @override
  Future<void> updatePhotoStatus(String psId, String photoId, String action) {
    return callApi(
      () => _galleryApiService.updatePhotoStatus(psId, photoId, action),
    );
  }
}
