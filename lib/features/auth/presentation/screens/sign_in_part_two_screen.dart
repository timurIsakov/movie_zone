import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:movie_zone/core/utils/animated_navigation.dart';
import 'package:movie_zone/core/utils/form_validator.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';
import 'package:movie_zone/core/widgets/error_flash_bar.dart';
import 'package:movie_zone/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movie_zone/features/main/presentation/screens/main_screen.dart';

import '../../../../core/widgets/input_widget.dart';
import '../widgets/header_progress_bar.dart';

class SignInPartTwoScreen extends StatefulWidget {
  final String email;
  const SignInPartTwoScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<SignInPartTwoScreen> createState() => _SignInPartTwoScreenState();
}

class _SignInPartTwoScreenState extends State<SignInPartTwoScreen> {
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
            if (state is AuthSignInError) {
              ErrorFlushBar(state.message).show(context);
            }
            if (state is AuthSignInSuccess) {
              AnimatedNavigation.push(
                  context: context, page: const MainScreen());
            }
          },
          builder: (context, state) {
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
                                  percent: 0.6,
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
                                    context.read<AuthCubit>().signIn(
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
