import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_zone/core/utils/animated_navigation.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/core/utils/form_validator.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';
import 'package:movie_zone/core/widgets/error_flash_bar.dart';
import 'package:movie_zone/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movie_zone/features/main/presentation/screens/main_screen.dart';

import '../../../../core/widgets/input_widget.dart';
import '../widgets/header_progress_bar.dart';

class SignUpPartThreeScreen extends StatefulWidget {
  final String name;
  final String email;
  const SignUpPartThreeScreen(
      {Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  State<SignUpPartThreeScreen> createState() => _SignUpPartThreeScreenState();
}

class _SignUpPartThreeScreenState extends State<SignUpPartThreeScreen> {
  late TextEditingController _controllerPassword;
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _initialize();
    super.initState();
  }

  _initialize() {
    _controllerPassword = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              ErrorFlushBar(state.message).show(context);
            }
            if (state is AuthSignUpSuccess) {
              AnimatedNavigation.push(
                  context: context, page: const MainScreen());
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: Lottie.asset(Assets.tMovieLoading),
              );
            }
            return LayoutBuilder(
              builder: (context, constraints) {
                return Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: SafeArea(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20).r,
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
                                  "createYourPassword".tr(),
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
                                  "signUpPartThreeDescriptionOne".tr(),
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
                                    text: "createYourPassword".tr(),
                                    controller: _controllerPassword,
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
                                    context.read<AuthCubit>().signUp(
                                        name: widget.name,
                                        email: widget.email,
                                        password: _controllerPassword.text);
                                  },
                                  isEnabled:
                                      _formKey.currentState?.validate() ??
                                          false,
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
            );
          },
        ),
      ),
    );
  }
}
