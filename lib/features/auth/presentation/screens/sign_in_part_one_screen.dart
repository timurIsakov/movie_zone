import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:movie_zone/core/utils/animated_navigation.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/core/utils/form_validator.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';
import 'package:movie_zone/features/auth/presentation/screens/sign_in_part_two_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core/widgets/input_widget.dart';

class SignInPartOneScreen extends StatefulWidget {
  const SignInPartOneScreen({Key? key}) : super(key: key);

  @override
  State<SignInPartOneScreen> createState() => _SignInPartOneScreenState();
}

class _SignInPartOneScreenState extends State<SignInPartOneScreen> {
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
    return KeyboardDismisser(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
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
                                  percent: 0.3,
                                  backgroundColor: const Color(0xff191B1C),
                                  progressColor: const Color(0xffEEEFF0),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(32).r,
                                      border: Border.all(
                                          color: const Color(0xffEEEFF0))),
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
                              "enterYourEmail".tr(),
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
                              "signInPartOneDescriptionOne".tr(),
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
                                text: "inputEmail".tr(),
                                controller: _textEditingController,
                                onChanged: (text) {
                                  setState(() {});
                                },
                                validator: (value) {
                                  return FormValidator.validateEmail(value);
                                },
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "signInPartOneDescriptionTwo".tr(),
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
                                    page: const SignInPartTwoScreen());
                              },
                              isEnabled:
                                  _formKey.currentState?.validate() ?? false,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
