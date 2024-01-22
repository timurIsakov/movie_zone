import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_zone/core/utils/assets.dart';

import '../../../../core/widgets/blur_container.dart';
import 'home_screen.dart';
import 'library_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<String> icons = [
    Assets.tHomeIcon,
    Assets.tSearchIcon,
    Assets.tPlayerIcon,
    Assets.tUserIcon,
  ];
  List<Widget> screens = [
    const HomeScreen(),
    const Placeholder(),
    const LibraryScreen(),
    // MovieDetailsScreen(),
    const ProfileScreen(),
    // const AccountSettings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8).r,
          child: BlurContainer(
              blur: 30,
              width: MediaQuery.of(context).size.width,
              height: 70.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                    icons.length,
                    (index) => InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = icons.indexOf(icons[index]);
                        });
                      },
                      child: SizedBox(
                        height: 24.h,
                        width: 24,
                        child: SvgPicture.asset(
                          icons[index],
                          colorFilter:
                              currentIndex == icons.indexOf(icons[index])
                                  ? const ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn)
                                  : const ColorFilter.mode(
                                      Color(0xff464C4F), BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
