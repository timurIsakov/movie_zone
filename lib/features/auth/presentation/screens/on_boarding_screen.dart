import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/utils/animated_navigation.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';

import 'sign_in_part_one_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height.h,
        width: MediaQuery.of(context).size.width.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.tOnBoardingBackground),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).r,
            child: Column(
              children: [
                const Spacer(),
                Text(
                  textAlign: TextAlign.center,
                  "onBoardingTitle".tr(),
                  style: TextStyle(
                    fontFamily: "SfProDisplay",
                    fontWeight: FontWeight.w700,
                    fontSize: 36.sp,
                    color: const Color(0xffEEEFF0),
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "onBoardingDescription".tr(),
                  style: TextStyle(
                    fontFamily: "SfProDisplay",
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: const Color(0xffB9BFC1),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                ButtonWidget(
                  onTap: () {
                    AnimatedNavigation.push(
                        context: context, page: const SignInPartOneScreen());
                  },
                  text: "signIn".tr(),
                ),
                SizedBox(
                  height: 16.h,
                ),
                ButtonWidget(
                  onTap: () {},
                  text: "signUp".tr(),
                  isOutline: true,
                ),
                SizedBox(
                  height: 52.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
