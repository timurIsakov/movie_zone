import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/features/main/domain/entities/movie_entity.dart';
import 'package:movie_zone/features/main/presentation/widgets/movie_card_widget.dart';
import 'package:video_player/video_player.dart';

class PlayersMinimizeStateScreen extends StatefulWidget {
  const PlayersMinimizeStateScreen({Key? key}) : super(key: key);

  @override
  State<PlayersMinimizeStateScreen> createState() =>
      _PlayersMinimizeStateScreenState();
}

class _PlayersMinimizeStateScreenState
    extends State<PlayersMinimizeStateScreen> {
  late VideoPlayerController _controller;
  late bool _showPannelControll;
  double _currentSliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    ))
      ..initialize().then((_) {
        setState(() {});
      });

    _controller.addListener(() {
      if (mounted) {
        setState(() {
          _currentSliderValue = _controller.value.position.inSeconds.toDouble();
        });
      }
    });
    _showPannelControll = true;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  String dropdownValue = "Season 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Timer(const Duration(seconds: 5), () {
                    setState(() {
                      _showPannelControll = false;
                    });
                  });
                  setState(() {
                    _showPannelControll = !_showPannelControll;
                  });
                },
                child: Stack(
                  children: [
                    SizedBox(
                      height: 270.h,
                      width: MediaQuery.of(context).size.width.w,
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )
                          : Container(),
                    ),
                    if (_showPannelControll)
                      Container(
                        height: 270.h,
                        width: MediaQuery.of(context).size.width.w,
                        color: Colors.black.withOpacity(0.3),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20).r,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 24).r,
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        Assets.tArrowBottomIcon,
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        Assets.tShareWifiIcon,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        Assets.tKebabMenuIcon,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 51.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      Assets.tBackward10Icon,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _controller.value.isPlaying
                                              ? _controller.pause()
                                              : _controller.play();
                                        });
                                      },
                                      icon: SvgPicture.asset(
                                        _controller.value.isPlaying
                                            ? Assets.tPauseIcon
                                            : Assets.tPlayIcon,
                                      )),
                                  IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      Assets.tForward10Icon,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    _currentSliderValue.toString(),
                                    style: TextStyle(
                                        color: const Color(0xffEEEFF0),
                                        fontFamily: "SfProDisplay",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
                                  Text(
                                    _controller.value.duration.inHours
                                        .toString(),
                                    style: TextStyle(
                                        color: const Color(0xffEEEFF0),
                                        fontFamily: "SfProDisplay",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width.w,
                                child: Slider(
                                    activeColor: Colors.white,
                                    inactiveColor: const Color(0xff191B1C),
                                    secondaryActiveColor:
                                        const Color(0xff272B2C),
                                    value: _currentSliderValue,
                                    min: 0.0,
                                    max: _controller.value.duration.inSeconds
                                        .toDouble(),
                                    onChanged: (value) {
                                      setState(() {
                                        _currentSliderValue = value;
                                      });
                                      _controller.seekTo(
                                          Duration(seconds: value.toInt()));
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 21.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 100.h,
                          width: 80.w,
                          child: Image.asset(Assets.tStrangerThingsImage),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Stranger Things",
                              style: TextStyle(
                                  color: const Color(0xffEEEFF0),
                                  fontFamily: "SfProDisplay",
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                              height: 0.h,),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "Episode 1",
                              style: TextStyle(
                                  color: const Color(0xffB9BFC1),
                                  fontFamily: "SfProDisplay",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,height: 0.h,),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "56m",
                                  style: TextStyle(
                                      color: const Color(0xffB9BFC1),
                                      fontFamily: "SfProDisplay",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,height: 0.h,),
                                ),
                                SizedBox(
                                  width: 12.h,
                                ),
                                Text(
                                  "Jul 15, 2016",
                                  style: TextStyle(
                                      color: const Color(0xffB9BFC1),
                                      fontFamily: "SfProDisplay",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,height: 0.h,),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "On November 6, 1983 in Hawkins, Indiana, a scientist is attacked by an unseen creature at a U.S. government laboratory. 12-year-old Will Byers encounters the creature and mysteriously vanishes while.... Read More",
                      style: TextStyle(
                          color: const Color(0xffB9BFC1),
                          fontFamily: "SfProDisplay",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          4,
                          (index) {
                            List<String> icons = [
                              Assets.tAddIcon,
                              Assets.tDownloadIcon,
                              Assets.tShareIcon,
                              Assets.tReportIcon,
                            ];
                            List<String> labels = [
                              "playerMinimizeAdd".tr(),
                              "playerMinimizeDownload".tr(),
                              "playerMinimizeShare".tr(),
                              "playerMinimizeReport".tr(),
                            ];
                            return GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  SizedBox(
                                    child: Center(
                                      child: SvgPicture.asset(
                                        icons[index],
                                        height: 36.h,
                                        width: 36.w,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    labels[index],
                                    style: TextStyle(
                                        color: const Color(0xffEEEFF0),
                                        fontFamily: "SfProDisplay",
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff1C1C1C),
                        borderRadius: BorderRadius.circular(8).r,
                        border: Border.all(color: Colors.white, width: 0.5.w),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8)
                            .r,
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "SfProDisplay",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                          underline: const SizedBox(),
                          dropdownColor: const Color(0xff1C1C1C),
                          isDense: true,
                          borderRadius: BorderRadius.circular(8).r,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Season 1',
                            'Season 2',
                            'Season 3',
                            'Season 4'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ...List.generate(
                        5,
                        (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 12).r,
                              child: MovieCardWidget(
                                  isHasPlayIcon: true,
                                  movieEntity: MovieEntity(
                                      title:
                                          "Chapter One: The Vanishing of Will Byers",
                                      post: Assets.tOppenheimerPost,
                                      description: "",
                                      trailerURL: "",
                                      trailerDuration: "56m",
                                      createdAt: DateTime.now())),
                            ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
