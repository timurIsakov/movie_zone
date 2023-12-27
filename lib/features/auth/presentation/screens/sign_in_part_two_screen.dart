import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:movie_zone/core/utils/animated_navigation.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/core/utils/form_validator.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core/widgets/input_widget.dart';
import 'sign_in_part_three_screen.dart';

class SignInPartTwoScreen extends StatefulWidget {
  const SignInPartTwoScreen({Key? key}) : super(key: key);

  @override
  State<SignInPartTwoScreen> createState() => _SignInPartTwoScreenState();
}

class _SignInPartTwoScreenState extends State<SignInPartTwoScreen> {
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
    //Email for continue
    _textEditingController.text = "Ibnndjcdcdn";
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
                        percent: 0.6,
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
                    "enterYourPassword".tr(),
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
                    "signInPartTwoDescriptionOne".tr(),
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
                  SizedBox(
                    child: InputWidget(
                      text: "inputPassword".tr(),
                      controller: _textEditingController,
                      onChanged: (text) {
                        setState(() {});
                      },
                      validator: (value) {
                        return FormValidator.password(value);
                      },
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "signInPartTwoDescriptionTwo".tr(),
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
                          context: context,
                          page: const SignInPartThreeScreen());
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
