import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';
import 'package:readmore/readmore.dart';

import '../../domain/entities/movie_entity.dart';

class MovieDetailsScreen extends StatefulWidget {
  final MovieEntity movieEntity;
  const MovieDetailsScreen({Key? key, required this.movieEntity})
      : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 450.h,
              width: MediaQuery.of(context).size.width.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        widget.movieEntity.post,
                      ),
                      fit: BoxFit.cover)),
              child: Container(
                height: 450.h,
                width: MediaQuery.of(context).size.width.w,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF0F1111),
                      Colors.transparent,
                      Colors.transparent,
                      Colors.transparent,
                      Color(0xFF0F1111),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20).r,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 68.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              height: 36.h,
                              width: 36.w,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )),
                          const Spacer(),
                          SizedBox(
                              height: 36.h,
                              width: 36.w,
                              child: IconButton(
                                icon: SvgPicture.asset(Assets.tAddIcon),
                                onPressed: () {},
                              )),
                          SizedBox(
                            width: 8.w,
                          ),
                          SizedBox(
                              height: 36.h,
                              width: 36.w,
                              child: IconButton(
                                icon: SvgPicture.asset(Assets.tShareIcon),
                                onPressed: () {},
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ButtonWidget(
                      text: "startWatching".tr(),
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 8).r,
                        child: SvgPicture.asset(
                          Assets.tPlayIcon,
                          height: 24.h,
                          width: 24.w,
                          colorFilter: const ColorFilter.mode(
                              Colors.black, BlendMode.srcIn),
                        ),
                      ),
                      onTap: () {}),
                  SizedBox(
                    height: 16.h,
                  ),
                  ButtonWidget(
                    text: "download".tr(),
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 8).r,
                      child: SvgPicture.asset(
                        Assets.tDownloadIcon,
                        height: 24.h,
                        width: 24.w,
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                      ),
                    ),
                    onTap: () {},
                    isOutline: true,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  ReadMoreText(
                    widget.movieEntity.description,
                    style: TextStyle(
                      color: const Color(0xffB9BFC1),
                      fontFamily: "SfProDisplay",
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                    trimLines: 5,
                    colorClickableText: Colors.white,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Read more',
                    trimExpandedText: '   Show less',
                    moreStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffEEEFF0)),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 100.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.movieEntity.post),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Stack(
                            children: [
                              Container(
                                height: 28.h,
                                width: 28.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100).r,
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
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
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "SfProDisplay",
                                color: const Color(0xffB9BFC1)),
                          ),
                          Text(
                            "trailerTitle".tr(args: [widget.movieEntity.title]),
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: "SfProDisplay",
                                color: const Color(0xffEEEFF0)),
                          ),
                          Text(
                            "trailerTime"
                                .tr(args: [widget.movieEntity.trailerDuration]),
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "SfProDisplay",
                                color: const Color(0xffB9BFC1)),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "basedOnCast"
                        .tr(args: [widget.movieEntity.title.toLowerCase()]),
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: "SfProDisplay",
                        color: const Color(0xffEEEFF0)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 12).r,
                            child: SizedBox(
                              height: 200.h,
                              width: 158.w,
                              child: const Placeholder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
