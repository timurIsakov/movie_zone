import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandWidget extends StatelessWidget {
  final String imageUrl;
  final String fullLogoUrl;
  final Function(String) onTap;
  const BrandWidget(
      {Key? key,
      required this.imageUrl,
      required this.onTap,
      required this.fullLogoUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call(fullLogoUrl);
      },
      child: Container(
        height: 82.h,
        width: 82.w,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
