import 'package:flutter/material.dart';

class ImageDialogWidget extends StatelessWidget {
  final String imageUrl;

  const ImageDialogWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: InteractiveViewer(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
