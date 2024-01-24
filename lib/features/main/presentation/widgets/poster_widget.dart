import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PosterWidget extends StatelessWidget {
  final double height;
  final double width;
  final String imageUrl;

  const PosterWidget(
      {Key? key, required this.imageUrl, this.height = 200, this.width = 158})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        image:
            DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
    );
  }
}
