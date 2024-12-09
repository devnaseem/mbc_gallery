import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;


class FullScreenImageView extends StatelessWidget {
  final String imagePath;

  const FullScreenImageView({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Fullscreen image with zoom
          Hero(
            tag: imagePath,
            child: PhotoView(
              imageProvider: CachedNetworkImageProvider(imagePath),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              backgroundDecoration: const BoxDecoration(color: Colors.black),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,

            ),
          ),
          // Bottom bar with Like and Share buttons
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.close, color: Colors.white,size: 25,) ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: Colors.black.withOpacity(0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Like Button
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Liked!')),
                        );
                      },
                      icon: const Icon(Icons.favorite, color: Colors.white),
                      label: const Text('Like', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  // Share Button
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () async {
                        try {
                          final file = await _downloadImage(imagePath);
                          await Share.shareXFiles([XFile(file.path)],
                              text: 'Check out this photo!');
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error sharing image: $e')),
                          );
                        }
                      },
                      icon: const Icon(Icons.share, color: Colors.white),
                      label: const Text('Share', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<File> _downloadImage(String url) async {
    final response = await http.get(Uri.parse(url));
    final documentDirectory = await getTemporaryDirectory();
    final filePath = '${documentDirectory.path}/${url.split('/').last}';

    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }
}
