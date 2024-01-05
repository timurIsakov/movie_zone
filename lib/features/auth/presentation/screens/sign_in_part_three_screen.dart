import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:movie_zone/core/utils/animated_navigation.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';
import 'package:movie_zone/features/main/presentation/screens/main_screen.dart';
import 'package:pinput/pinput.dart';

import '../widgets/header_progress_bar.dart';

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
                            HeaderProgressBar(
                              onTapArrow: () {
                                Navigator.pop(context);
                              },
                              onTapHelp: () {},
                              percent: 0.9,
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
                                  return s == '2222'
                                      ? null
                                      : 'Pin is incorrect';
                                },
                                pinputAutovalidateMode:
                                    PinputAutovalidateMode.onSubmit,
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
