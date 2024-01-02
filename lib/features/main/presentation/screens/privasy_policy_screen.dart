import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivasyPolicyScreen extends StatefulWidget {
  const PrivasyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivasyPolicyScreen> createState() => _PrivasyPolicyScreenState();
}

class _PrivasyPolicyScreenState extends State<PrivasyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          splashColor: Colors.white,
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xffEEEFF0),
            size: 24,
          ),
        ),
        title: Text(
          "privasyPolicy".tr(),
          style: TextStyle(
            fontFamily: "SfProDisplay",
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xffEEEFF0),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 16.h,
          ),
        ]),
      ),
    );
  }
}
