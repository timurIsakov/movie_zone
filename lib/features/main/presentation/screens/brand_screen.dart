import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/features/main/presentation/widgets/scroll_panel_widget.dart';

class BrandScreen extends StatefulWidget {
  final String logoUrl;
  const BrandScreen({Key? key, required this.logoUrl}) : super(key: key);

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 375.h,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.tBrandsBackground),
                    fit: BoxFit.cover),
              ),
              child: Container(
                height: 375.h,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff111111),
                      Colors.transparent,
                      Colors.transparent,
                      Colors.transparent,
                      Color(0xff111111),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20).r,
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 36.h,
                              width: 36.w,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                    Icons.arrow_back_ios_new_outlined),
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 41.h,
                          width: 152.w,
                          child: Image.network(
                            widget.logoUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20).r,
              child: Column(
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  ScrollPanelWidget(
                      title: "featured".tr(), movieEntities: const []),
                  SizedBox(
                    height: 32.h,
                  ),
                  ScrollPanelWidget(
                      title: "mostWatched".tr(), movieEntities: const []),
                  SizedBox(
                    height: 120.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
