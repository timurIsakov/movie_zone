import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/api/api_constants.dart';
import '../../domain/entities/movie_entity.dart';
import 'poster_widget.dart';

class ScrollPanelWidget extends StatelessWidget {
  final String title;
  final List<MovieEntity> movieEntities;
  const ScrollPanelWidget(
      {Key? key, required this.title, required this.movieEntities})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: const Color(0xffEEEFF0),
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                fontFamily: "SfProDisplay",
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            const SizedBox(
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 24,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: movieEntities.length,
              itemBuilder: (context, index) {
                final movie = movieEntities[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12).r,
                  child: PosterWidget(
                    imageUrl: "${ApiConstants.imageApiUrl}${movie.imageUrl}",
                  ),
                );
              }),
        ),
      ],
    );
  }
}
