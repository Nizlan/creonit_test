import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerElement extends StatelessWidget {
  const ShimmerElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        color: Colors.white,
      ),
    );
  }
}
