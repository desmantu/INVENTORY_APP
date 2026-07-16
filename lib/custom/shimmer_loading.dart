import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  final Widget? child;
  const ShimmerLoading({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        direction: ShimmerDirection.ltr,
        period: Duration(milliseconds: 2000),
        child: child ?? SizedBox(),
    );
  }
}