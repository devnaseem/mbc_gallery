import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.url,
    this.width = 186.0,
    this.height = 157.0,
    this.isCover = true,
    required this.id,
  });
  // Attributes
  final String url;
  final double width;
  final double height;
  final bool isCover;
  final String id;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fadeInDuration: const Duration(milliseconds: 200),
      fit: isCover ? BoxFit.cover : BoxFit.fitHeight,
      height: height,
      width: width,
      placeholder: MemoryImage(kTransparentImage),
      image: CachedNetworkImageProvider(url,
      cacheKey: id,
      ),
    );
  }
}
