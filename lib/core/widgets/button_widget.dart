import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final bool isOutline;
  final bool isEnabled;
  final Function() onTap;
  const ButtonWidget(
      {Key? key,
      required this.text,
      this.isOutline = false,
      this.isEnabled = true,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        height: 43.h,
        width: MediaQuery.of(context).size.width.w,
        decoration: BoxDecoration(
            border:
                isOutline ? Border.all(color: const Color(0xffEEEFF0)) : null,
            borderRadius: BorderRadius.circular(8).r,
            color:
                isOutline ? const Color(0xff101111) : const Color(0xffEEEFF0)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "SfProDisplay",
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color:
                  isOutline ? const Color(0xffEEEFF0) : const Color(0xff191B1C),
            ),
          ),
        ),
      ),
    );
  }
}
