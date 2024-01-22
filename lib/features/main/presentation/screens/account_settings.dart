import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/widgets/input_widget.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
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
                  border:
                      Border.all(color: const Color(0xff656E72), width: 1.5.w),
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
            const InputWidget(text: ""),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "emailAddress".tr(),
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
            const InputWidget(text: ""),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "password".tr(),
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
            const InputWidget(text: ""),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(100).r,
                child: Ink(
                  height: 50.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100).r,
                    border: Border.all(
                        color: const Color(0xff656E72), width: 1.5.w),
                    color: const Color(0xff191B1C),
                  ),
                  child: const Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
