import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/features/main/domain/entities/movie_entity.dart';

class MovieCardWidget extends StatelessWidget {
  final MovieEntity movieEntity;
  final bool isHasPlayIcon;
  const MovieCardWidget(
      {Key? key, required this.movieEntity, this.isHasPlayIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100.h,
          width: 140.w,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(movieEntity.post), fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isHasPlayIcon)
                Center(
                  child: Container(
                    height: 28.h,
                    width: 28.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffEEEFF0),
                      borderRadius: BorderRadius.circular(100).r,
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      size: 16,
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        SizedBox(
          width: 140.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movieEntity.title,
                style: TextStyle(
                  color: const Color(0xffEEEFF0),
                  fontFamily: "SfProDisplay",
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  height: 0.h,
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
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      height: 0.h,
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
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      height: 0.h,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 24.h,
          width: 24.w,
          child: SvgPicture.asset(Assets.tDownloadIcon),
        )
      ],
    );
  }
}
