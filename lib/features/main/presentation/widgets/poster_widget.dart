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
      // child: Stack(
      //   children: [
      //     if (hasNewEpisodes)
      //       Positioned(
      //         top: 8,
      //         left: 8,
      //         child: Container(
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(12).r,
      //                 color: const Color(0xffEEEFF0)),
      //             child: Padding(
      //               padding:
      //                   const EdgeInsets.symmetric(horizontal: 12, vertical: 5)
      //                       .r,
      //               child: Text(
      //                 "newEpisode".tr(),
      //                 style: TextStyle(
      //                   fontFamily: "SfProDisplay",
      //                   fontWeight: FontWeight.w500,
      //                   fontSize: 12.sp,
      //                   color: Colors.black,
      //                 ),
      //               ),
      //             )),
      //       )
      //   ],
      // ),
    );
  }
}
