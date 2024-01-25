import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:movie_zone/core/widgets/button_widget.dart';
import 'package:movie_zone/core/widgets/input_widget.dart';
import 'package:movie_zone/core/widgets/success_flush_bar.dart';
import 'package:movie_zone/features/auth/domain/entities/user_entity.dart';
import 'package:movie_zone/features/main/presentation/cubit/profile/profile_cubit.dart';

class AccountSettings extends StatefulWidget {
  final UserEntity userEntity;
  const AccountSettings({Key? key, required this.userEntity}) : super(key: key);

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  final TextEditingController controllerName = TextEditingController();

  @override
  void initState() {
    controllerName.text = widget.userEntity.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff0F1111),
          title: Text(
            "account".tr(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              fontFamily: "SF Pro Display",
            ),
          ),
        ),
        body: BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileSuccessUpdate) {
              BlocProvider.of<ProfileCubit>(context).load();
              Navigator.pop(context);
              SuccessFlushBar("Saved!").show(context);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 39.h,
                ),
                Center(
                  child: Container(
                    height: 92.h,
                    width: 92.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100).r,
                      border: Border.all(
                          color: const Color(0xff656E72), width: 1.5.w),
                      color: const Color(0xff191B1C),
                    ),
                  ),
                ),
                SizedBox(
                  height: 57.h,
                ),
                Text(
                  "fullName".tr(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "SF Pro Display",
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                InputWidget(text: "", controller: controllerName),
                SizedBox(
                  height: 40.h,
                ),
                ButtonWidget(
                  text: "Save",
                  isOutline: true,
                  onTap: () {
                    widget.userEntity.name = controllerName.text;
                    BlocProvider.of<ProfileCubit>(context).updateCurrentUser(
                      userEntity: widget.userEntity,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
