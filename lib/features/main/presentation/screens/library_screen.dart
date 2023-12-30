import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/features/main/domain/entities/category_entity.dart';
import 'package:movie_zone/features/main/domain/entities/movie_entity.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/switcher_categories_widget.dart';
import '../widgets/movie_card_widget.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<CategoryEntity> listChoses = const [
    CategoryEntity(
      title: "Movies",
      categoryId: '',
    ),
    CategoryEntity(
      title: "Series",
      categoryId: '',
    ),
    CategoryEntity(
      title: "TV Shows",
      categoryId: '',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text(
                "myLibrary".tr(),
                style: TextStyle(
                  fontFamily: "SfProDisplay",
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                  color: const Color(0xffEEEFF0),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SwitcherCategoriesWidget(
                listOfCategory: listChoses,
                onTap: (String categoryId) {},
              ),
              SizedBox(
                height: 32.h,
              ),
              ...List.generate(
                2,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20).r,
                  child: MovieCardWidget(
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
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20).r,
                child: Text(
                  "libraryDescription".tr(),
                  style: TextStyle(
                    fontFamily: "SfProDisplay",
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: const Color(0xffB9BFC1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
