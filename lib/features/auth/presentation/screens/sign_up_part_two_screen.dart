import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:movie_zone/core/utils/animated_navigation.dart';
import 'package:movie_zone/core/utils/form_validator.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';
import 'package:movie_zone/features/auth/presentation/screens/sign_in_part_two_screen.dart';

import '../../../../core/widgets/input_widget.dart';
import '../widgets/header_progress_bar.dart';

class SignUpPartTwoScreen extends StatefulWidget {
  const SignUpPartTwoScreen({Key? key}) : super(key: key);

  @override
  State<SignUpPartTwoScreen> createState() => _SignUpPartTwoScreenState();
}

class _SignUpPartTwoScreenState extends State<SignUpPartTwoScreen> {
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
                            HeaderProgressBar(
                              onTapArrow: () {
                                Navigator.pop(context);
                              },
                              onTapHelp: () {},
                              percent: 0.3,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "inputEmail".tr(),
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
                              "signUpPartOneDescriptionTwo".tr(),
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
