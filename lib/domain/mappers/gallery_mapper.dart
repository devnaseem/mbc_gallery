import 'package:mbc_gallery/data/dto/gallery_list_response.dart';
import 'package:mbc_gallery/domain/model/gallery_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final galleryMapperProvider = Provider<GalleryMapper>((ref) {
  return GalleryMapper();
});

class GalleryMapper {
  List<GalleryItemModel> toDomain(
    List<GalleryItemResponse> photosListResponse,
  ) {
    return photosListResponse.map(toGalleryItemModel).toList();
  }

  GalleryItemModel toGalleryItemModel(GalleryItemResponse photo) {
    return GalleryItemModel(
      id: photo.id,
      createdAt: photo.createdAt,
      visitId: photo.visitId,
      photos: photo.photos
          .map((photoItem) => PhotoModel(
              url: photoItem.url,
              resolution: ResolutionModel(
                format: photoItem.resolution.format,
                quality: photoItem.resolution.quality,
                height: photoItem.resolution.height,
                width: photoItem.resolution.width,
                zoom: photoItem.resolution.zoom,
              )))
          .toList(),
      likes: photo.likes
          .map((key, value) => MapEntry(
              key, LikeDetailModel(likeAt: value.likedAt, name: value.name)))
          .cast(),
    );
  }
}
