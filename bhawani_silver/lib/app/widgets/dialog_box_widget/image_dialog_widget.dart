import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageDialogWidget extends StatelessWidget {
  final String image_url;

  const ImageDialogWidget({super.key, required this.image_url});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: InteractiveViewer(
        child: CachedNetworkImage(
          imageUrl: image_url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
