import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mbc_gallery/domain/model/gallery_item_model.dart';
import 'package:mbc_gallery/presentation/view_model/gallery_view_model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FullScreenImageView extends ConsumerStatefulWidget {
  final String imagePath;
  final GalleryItemModel galleryItem;

  const FullScreenImageView(
      {Key? key, required this.imagePath, required this.galleryItem});

  @override
  _FullScreenImageViewState createState() => _FullScreenImageViewState();
}

class _FullScreenImageViewState extends ConsumerState<FullScreenImageView> {
  bool isLiked = false;

  @override
  void initState() {
    final userCognitoId =
        ref.read(galleryViewModelProvider.select((state) => state.cognitoId));
    isLiked = widget.galleryItem.likes.containsKey(userCognitoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final systemId =
        ref.read(galleryViewModelProvider.select((state) => state.psId));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Hero(
              tag: widget.imagePath,
              child: PhotoView(
                imageProvider: CachedNetworkImageProvider(widget.imagePath),
                initialScale: PhotoViewComputedScale.contained * 0.8,
                backgroundDecoration: const BoxDecoration(color: Colors.black),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 25,
                    )),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      'Wellness Photo on ${DateFormat('MMM d, y').format(DateTime.now())}',
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: 0.5,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextButton.icon(
                            onPressed: () {
                              setState(() {
                                isLiked = !isLiked;
                              });
                              ref
                                  .read(galleryViewModelProvider.notifier)
                                  .updatePhotoStatus(
                                    systemId,
                                    widget.galleryItem.id,
                                    isLiked ? 'like' : 'unlike',
                                  );
                            },
                            icon: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_outline,
                              color: Colors.white,
                              size: 19,
                            ),
                            label: Container(
                              width: 50,
                              child: Text(
                                isLiked ? 'LIKED' : 'LIKE',
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: .5,
                          height: 40,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: TextButton.icon(
                            onPressed: () async {
                              try {
                                final file =
                                    await _downloadImage(widget.imagePath);
                                await Share.shareXFiles([XFile(file.path)],
                                    text: 'Check out this photo!');
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Error sharing image: $e')),
                                );
                              }
                            },
                            // icon: Icon(
                            //   Icons.share,
                            //   color: Colors.white,
                            //   size: 19,
                            // ),
                            icon: SvgPicture.asset(
                              'packages/mbc_gallery/package_assets/share_icon_two.svg',
                              width: 19.0,
                              height: 19.0,
                            ),
                            label: Text(
                              'SHARE',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<File> _downloadImage(String url) async {
    final response = await http.get(Uri.parse(url));
    final documentDirectory = await getTemporaryDirectory();
    final filePath = '${documentDirectory.path}/gallery_image.jpeg';

    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }
}
