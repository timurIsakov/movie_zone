import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/features/main/presentation/cubit/profile/profile_cubit.dart';

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
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 52.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (BuildContext context, ProfileState state) {
                if (state is ProfileLoading) {
                  return const Center(child: RefreshProgressIndicator());
                }
                if (state is ProfileLoaded) {
                  return ProfileUserWidget(
                      user: state.userEntity, onTap: () {});
                }
                return const SizedBox();
              },
            ),
          ),
          SizedBox(height: 52.h),
          _categoryWidget("settings"),
          ProfileItemWidget(
            title: 'language',
            onTap: () {},
          ),
          ProfileItemWidget(
            title: 'notification',
            onTap: () {},
          ),
          ProfileItemWidget(
            title: 'manageDownload',
            onTap: () {},
          ),
          ProfileItemWidget(
            title: 'manageDevices',
            onTap: () {},
          ),
          SizedBox(height: 28.h),
          _categoryWidget("Others"),
          ProfileItemWidget(
            title: 'history',
            onTap: () {},
          ),
          ProfileItemWidget(
            title: 'privacyPolicy',
            onTap: () {},
          ),
          ProfileItemWidget(
            title: 'helpCenter',
            onTap: () {},
          ),
          ProfileItemWidget(
            title: 'ratings',
            onTap: () {},
          ),
          SizedBox(height: 28.h),
          ProfileItemWidget(
            withUnderline: false,
            prefix: const Icon(Icons.exit_to_app, color: Colors.white),
            title: 'logOut',
            onTap: () {},
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
          color: Color(0xFFEEEFF0),
          fontSize: 16,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
