import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_zone/core/utils/assets.dart';

class BrandsScreen extends StatefulWidget {
  const BrandsScreen({Key? key}) : super(key: key);

  @override
  State<BrandsScreen> createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 450.h,
              width: MediaQuery.of(context).size.width.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        Assets.tBrandsBackground,
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
                      Color(0xFF0F1111),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 68.h,
                      ),
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
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: SizedBox(
                          height: 41.h,
                          width: 153.w,
                          child: SvgPicture.asset(
                            Assets.tNetflixLogo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 37.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    "brandFeatured".tr(),
                    style: TextStyle(
                      color: const Color(0xffEEEFF0),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "SfProDisplay",
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                            10,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(right: 12).r,
                                  child: Container(
                                    height: 200.h,
                                    width: 158.w,
                                    color: Colors.red,
                                  ),
                                ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    "brandMostWatched".tr(),
                    style: TextStyle(
                      color: const Color(0xffEEEFF0),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "SfProDisplay",
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                            10,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(right: 12).r,
                                  child: Container(
                                    height: 200.h,
                                    width: 158.w,
                                    color: Colors.red,
                                  ),
                                ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 120.h,
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
