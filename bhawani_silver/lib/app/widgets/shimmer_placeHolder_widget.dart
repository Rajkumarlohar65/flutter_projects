import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceholderWidget extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerPlaceholderWidget({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseColor = Theme.of(context).brightness == Brightness.light
        ? Colors.grey[300]
        : Colors.grey[800];
    final highlightColor = Theme.of(context).brightness == Brightness.light
        ? Colors.grey[100]
        : Colors.grey[600];

    return Shimmer.fromColors(
      baseColor: baseColor!,
      highlightColor: highlightColor!,
      child: Container(
        width: width,
        height: height,
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black,
      ),
    );
  }
}
