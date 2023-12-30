import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
          child: Image.network(movieEntity.post),
        ),
        SizedBox(
          width: 8.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movieEntity.title,
              style: TextStyle(
                color: const Color(0xffEEEFF0),
                fontFamily: "SfProDisplay",
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                Text(
                  movieEntity.trailerDuration,
                  style: TextStyle(
                    color: const Color(0xffB9BFC1),
                    fontFamily: "SfProDisplay",
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  movieEntity.createdAt.year.toString(),
                  style: TextStyle(
                    color: const Color(0xffB9BFC1),
                    fontFamily: "SfProDisplay",
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 21.w,
        ),
        SizedBox(
          height: 24.h,
          width: 24.w,
          child: SvgPicture.asset(Assets.tDownloadIcon),
        )
      ],
    );
  }
}
