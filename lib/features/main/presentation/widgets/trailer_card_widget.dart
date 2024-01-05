import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrailerCardWidget extends StatelessWidget {
  final String trailerUrl;
  final String title;
  final String duration;
  const TrailerCardWidget(
      {Key? key,
      required this.trailerUrl,
      required this.title,
      required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100.h,
          width: 150.w,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(trailerUrl), fit: BoxFit.cover),
          ),
          child: Center(
            child: Container(
                height: 28.h,
                width: 28.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                )),
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "trailer".tr(),
              style: TextStyle(
                color: const Color(0xffB9BFC1),
                fontFamily: "SfProDisplay",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "SfProDisplay",
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              duration,
              style: TextStyle(
                color: const Color(0xffB9BFC1),
                fontFamily: "SfProDisplay",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                height: 0,
              ),
            ),
          ],
        )
      ],
    );
  }
}
