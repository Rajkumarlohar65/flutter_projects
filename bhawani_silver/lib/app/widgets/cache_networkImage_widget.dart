import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'shimmer_placeholder_widget.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;

  const CachedNetworkImageWidget({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, imageUrl) {
        return const ShimmerPlaceholderWidget(width: double.infinity, height: double.infinity);
      },
      errorWidget: (context, url, error) {
        return const ShimmerPlaceholderWidget(width: double.infinity, height: double.infinity);
      },
    );
  }
}
