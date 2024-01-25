import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/utils/animated_navigation.dart';
import 'package:movie_zone/core/widgets/loading_widget.dart';
import 'package:movie_zone/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:movie_zone/features/auth/presentation/screens/on_boarding_screen.dart';
import 'package:movie_zone/features/main/presentation/cubit/profile/profile_cubit.dart';
import 'package:movie_zone/features/main/presentation/screens/account_settings.dart';

import '../widgets/profile_item_widget.dart';
import '../widgets/profile_user_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize() {
    BlocProvider.of<ProfileCubit>(context).load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          SizedBox(height: 52.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const LoadingWidget(
                    size: 120,
                  );
                }
                if (state is ProfileLoaded) {
                  return ProfileUserWidget(
                    user: state.userEntity,
                    onTap: () {
                      AnimatedNavigation.push(
                          context: context,
                          page: AccountSettings(
                            userEntity: state.userEntity,
                          ));
                    },
                  );
                }

                return const SizedBox();
              },
            ),
          ),
          SizedBox(height: 52.h),
          _categoryWidget("Settings"),
          ProfileItemWidget(
            title: 'Language',
            onTap: () {},
          ),
          ProfileItemWidget(
            title: 'Notification',
            onTap: () {},
          ),
          ProfileItemWidget(
            title: 'Manage Download',
            onTap: () {},
          ),
          ProfileItemWidget(
            title: 'Manage Devices',
            onTap: () {},
          ),
          SizedBox(height: 28.h),
          _categoryWidget("Others"),
          ProfileItemWidget(
            title: 'History',
            onTap: () {},
          ),
          ProfileItemWidget(
            title: 'Privacy Policy',
            onTap: () {},
          ),
          ProfileItemWidget(
            title: 'Help Center',
            onTap: () {},
          ),
          ProfileItemWidget(
            title: 'Ratings',
            onTap: () {},
          ),
          SizedBox(height: 28.h),
          ProfileItemWidget(
            withUnderline: false,
            prefix: const Icon(Icons.exit_to_app, color: Colors.white),
            title: 'logOut',
            onTap: () {
              BlocProvider.of<AuthCubit>(context).logOut();
              AnimatedNavigation.push(
                  context: context, page: const OnBoardingScreen());
            },
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: const Text(
              "Version: 1.0",
              style: TextStyle(
                color: Color(0xFFB9BFC1),
                fontSize: 16,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  _categoryWidget(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Text(
        title.tr(),
        style: const TextStyle(
          color: Color(0xffB9BFC1),
          fontSize: 16,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
