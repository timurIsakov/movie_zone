import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';
import 'package:movie_zone/features/main/domain/entities/movie_entity.dart';
import 'package:movie_zone/features/main/presentation/widgets/scroll_panel_widget.dart';
import 'package:movie_zone/features/main/presentation/widgets/trailer_card_widget.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 450.h,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://movies.universalpictures.com/media/opr-tsr1sheet3-look2-rgb-3-1-1-64545c0d15f1e-1.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff111111),
                      Colors.transparent,
                      Colors.transparent,
                      Colors.transparent,
                      Color(0xff111111),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20).r,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 36.h,
                              width: 36.w,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_ios_sharp,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 36.h,
                              width: 36.w,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            SizedBox(
                              height: 36.h,
                              width: 36.w,
                              child: SvgPicture.asset(Assets.tShareIcon,
                                  fit: BoxFit.scaleDown),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).r,
              child: Column(
                children: [
                  ButtonWidget(
                    text: "startWatching".tr(),
                    onTap: () {},
                    icon: const Icon(Icons.play_arrow),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ButtonWidget(
                    text: "download".tr(),
                    onTap: () {},
                    isOutline: true,
                    icon: SvgPicture.asset(Assets.tDownloadIcon),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    "test",
                    // widget.movieEntity.description,
                    style: TextStyle(
                      fontFamily: "SfProDisplay",
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: const Color(0xffB9BFC1),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  const TrailerCardWidget(
                    trailerUrl:
                        "https://movies.universalpictures.com/media/opr-tsr1sheet3-look2-rgb-3-1-1-64545c0d15f1e-1.jpg",
                    title: "Oppenheimer",
                    duration: "1m 45s",
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20).r,
              child: Column(
                children: [
                  ScrollPanelWidget(
                    title: "basedOnCast".tr(args: [widget.movieEntity.title]),
                    movieEntities: const [],
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
