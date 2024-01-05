import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core/utils/assets.dart';

class HeaderProgressBar extends StatelessWidget {
  final Function() onTapArrow;
  final Function() onTapHelp;
  final double percent;
  const HeaderProgressBar(
      {Key? key,
      required this.onTapArrow,
      required this.onTapHelp,
      required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            onTapArrow.call();
          },
          icon: SvgPicture.asset(
            Assets.tLeftArrowIcon,
            fit: BoxFit.cover,
          ),
        ),
        LinearPercentIndicator(
          barRadius: const Radius.circular(12).r,
          width: 120.w,
          lineHeight: 8.h,
          percent: percent,
          backgroundColor: const Color(0xff191B1C),
          progressColor: const Color(0xffEEEFF0),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32).r,
              border: Border.all(color: const Color(0xffEEEFF0))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16).r,
            child: Text(
              "buttonHelp".tr(),
              style: TextStyle(
                fontFamily: "SfProDisplay",
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                color: const Color(0xffEEEFF0),
              ),
            ),
          ),
        )
      ],
    );
  }
}
