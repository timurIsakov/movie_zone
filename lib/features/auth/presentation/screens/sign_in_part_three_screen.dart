import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:movie_zone/core/utils/animated_navigation.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';
import 'package:movie_zone/features/main/presentation/screens/main_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pinput/pinput.dart';

class SignInPartThreeScreen extends StatefulWidget {
  const SignInPartThreeScreen({Key? key}) : super(key: key);

  @override
  State<SignInPartThreeScreen> createState() => _SignInPartThreeScreenState();
}

class _SignInPartThreeScreenState extends State<SignInPartThreeScreen> {
  late TextEditingController _textEditingController;
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _initialize();
    super.initState();
  }

  _initialize() {
    _textEditingController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      margin: EdgeInsets.symmetric(horizontal: 16.w / 4).r,
      width: 64.w,
      height: 64.h,
      textStyle: const TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: const Color(0xff191B1C),
        border: Border.all(color: const Color(0xff656E72)),
        borderRadius: BorderRadius.circular(8).r,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color(0xff191B1C),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8).r,
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(8).r,
      ),
    );

    return KeyboardDismisser(
      child: Scaffold(
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(
                          Assets.tLeftArrowIcon,
                          fit: BoxFit.cover,
                        ),
                      ),
                      LinearPercentIndicator(
                        barRadius: const Radius.circular(12).r,
                        width: 120.w,
                        lineHeight: 8.h,
                        percent: 1,
                        backgroundColor: const Color(0xff191B1C),
                        progressColor: const Color(0xffEEEFF0),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32).r,
                            border: Border.all(color: const Color(0xffEEEFF0))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16)
                              .r,
                          child: Text(
                            "buttonHelp".tr(),
                            style: TextStyle(
                              fontFamily: "SfProDisplay",
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: const Color(0xffEEEFF0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "enterOTPcode".tr(),
                    style: TextStyle(
                      fontFamily: "SfProDisplay",
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                      color: const Color(0xffEEEFF0),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "signInPartThreeDescriptionOne".tr(),
                    style: TextStyle(
                      fontFamily: "SfProDisplay",
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: const Color(0xffB9BFC1),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Center(
                    child: Pinput(
                      controller: _textEditingController,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      errorPinTheme: errorPinTheme,
                      validator: (s) {
                        return s == '2222' ? null : 'Pin is incorrect';
                      },
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: false,
                      onCompleted: (pin) => setState(
                        () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    "signInPartThreeDescriptionTwo".tr(),
                    style: TextStyle(
                      fontFamily: "SfProDisplay",
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: const Color(0xffB9BFC1),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "signInPartThreeDescriptionThree".tr(),
                    style: TextStyle(
                      fontFamily: "SfProDisplay",
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: const Color(0xffB9BFC1),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  ButtonWidget(
                    text: "continue".tr(),
                    onTap: () {
                      AnimatedNavigation.push(
                          context: context, page: const MainScreen());
                    },
                    isEnabled: _formKey.currentState?.validate() ?? false,
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
