import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:navigator_scope/navigator_scope.dart';

import '../../../../core/widgets/blur_container.dart';
import '../../domain/entities/movie_entity.dart';
import 'home_screen.dart';
import 'library_screen.dart';
import 'movie_details_screen.dart';

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
    MovieDetailsScreen(
      movieEntity: MovieEntity(
        description:
            "Oppenheimer is a biographical film that chronicles the life of J. Robert Oppenheimer, a brilliant physicist who was instrumental in developing the atomic bomb during World War II. This film explores Oppenheim... ",
        title: 'Oppenheimer',
        imageUrl:
            'https://movies.universalpictures.com/media/opr-tsr1sheet3-look2-rgb-3-1-1-64545c0d15f1e-1.jpg',
        overall: 100,
        time: '3h 1m',
        createdAt: DateTime.now(),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: NavigatorScope(
        currentDestination: currentIndex,
        destinationCount: screens.length,
        destinationBuilder: (context, index) {
          return NestedNavigator(
            builder: (context) => screens[index],
          );
        },
      ),
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
