import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/features/main/domain/entities/movie_entity.dart';

class MovieCardWidget extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieCardWidget({Key? key, required this.movieEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 100.h,
          width: 140.w,
          child: Image.network(
            movieEntity.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movieEntity.title,
              style: TextStyle(
                color: const Color(0xFFEEEFF0),
                fontSize: 18.sp,
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Text(
                  "test",

                  //movieEntity.time,
                  style: TextStyle(
                    color: const Color(0xFFB9BFC1),
                    fontSize: 14.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  "test",

                  // "${movieEntity.createdAt.day}/${movieEntity.createdAt.month}/${movieEntity.createdAt.year}",
                  style: TextStyle(
                    color: const Color(0xFFB9BFC1),
                    fontSize: 14.sp,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
          height: 24.h,
          width: 24.w,
          child: SvgPicture.asset(
            Assets.tDownloadIcon,
            colorFilter:
                const ColorFilter.mode(Color(0xffEEEFF0), BlendMode.srcIn),
          ),
        )
      ],
    );
  }
}
