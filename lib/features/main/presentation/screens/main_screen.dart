import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_zone/features/main/presentation/screens/movie_details_screen.dart';

import '../../../../core/utils/assets.dart';
import '../../domain/entities/movie_entity.dart';
import 'library_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> listOfScreen = [
    const LibraryScreen(),
    MovieDetailsScreen(
      movieEntity: MovieEntity(
        title: "Oppenheimer",
        post: Assets.tOppenheimerPost,
        description:
            "\"Oppenheimer\" is a biographical film that chronicles the life of J. Robert Oppenheimer, a brilliant physicist who was instrumental in developing the atomic bomb during World War II. This film explores Oppenheim Loream Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        trailerURL: "",
        trailerDuration: "1m 45s",
        createdAt: DateTime.now(),
      ),
    ),
    const Placeholder(),
    const Placeholder(),
  ];
  int currentIndex = 0;
  List<String> itemsBottomBar = [
    Assets.tHomeIcon,
    Assets.tSearchIcon,
    Assets.tPlayerIcon,
    Assets.tUserIcon,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        listOfScreen[currentIndex],
        Positioned(
          bottom: 35,
          right: 8,
          left: 8,
          child: Container(
            height: 75.h,
            width: MediaQuery.of(context).size.width.w,
            decoration: BoxDecoration(
              color: const Color(0xff464C4F).withOpacity(0.6),
              borderRadius: BorderRadius.circular(28).r,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 35, vertical: 25).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    itemsBottomBar.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          itemsBottomBar[index],
                          colorFilter: currentIndex == index
                              ? const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn)
                              : const ColorFilter.mode(
                                  Color(0xff464C4F), BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
