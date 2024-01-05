import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final bool isOutline;
  final bool isEnabled;
  final Function() onTap;
  final Widget? icon;
  const ButtonWidget(
      {Key? key,
      required this.text,
      this.isOutline = false,
      this.isEnabled = true,
      required this.onTap,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isEnabled ? onTap.call() : null;
      },
      child: Container(
        height: icon == null ? 43.h : 48.h,
        width: MediaQuery.of(context).size.width.w,
        decoration: BoxDecoration(
            border:
                isOutline ? Border.all(color: const Color(0xffEEEFF0)) : null,
            borderRadius: BorderRadius.circular(8).r,
            color: isEnabled
                ? isOutline
                    ? const Color(0xff101111)
                    : const Color(0xffEEEFF0)
                : const Color(0xff272B2C)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8).r,
                  child: icon!,
                ),
              Text(
                text,
                style: TextStyle(
                  fontFamily: "SfProDisplay",
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: isEnabled
                      ? isOutline
                          ? const Color(0xffEEEFF0)
                          : const Color(0xff191B1C)
                      : const Color(0xff747E83),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
