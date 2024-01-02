import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/core/widgets/input_widget.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250.h,
            width: MediaQuery.of(context).size.width.w,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.tHelpBackground),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                SizedBox(
                  height: 84.h,
                ),
                Text(
                  "helpMainTitle".tr(),
                  style: TextStyle(
                      fontFamily: "SfProDisplay",
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffEEEFF0)),
                ),
                SizedBox(
                  height: 31.h,
                ),
                SizedBox(
                  height: 41.h,
                  width: 335.w,
                  child: InputWidget(
                    text: "helpInputTitle".tr(),
                    onChanged: (p0) {},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 31.h,
                ),
                Text(
                  "helpCategoryPopular".tr(),
                  style: TextStyle(
                      fontFamily: "SfProDisplay",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffB9BFC1)),
                ),
                SizedBox(
                  height: 8.h,
                ),

                SizedBox(
                  height: 28.h,
                ),
                Text(
                  "helpCategoryWatching".tr(),
                  style: TextStyle(
                      fontFamily: "SfProDisplay",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffB9BFC1)),
                ),
                SizedBox(
                  height: 8.h,
                ),
                //generate answers
              ],
            ),
          )
        ],
      ),
    );
  }
}
