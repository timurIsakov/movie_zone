import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/features/auth/presentation/widgets/movie_card_widget.dart';

import '../../../../core/widgets/category_switcher_widget.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/movie_entity.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<CategoryEntity> categories = const [
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
    final entity = MovieEntity(
      description:
          "Oppenheimer is a biographical film that chronicles the life of J. Robert Oppenheimer, a brilliant physicist who was instrumental in developing the atomic bomb during World War II. This film explores Oppenheim... ",
      title: 'Oppenheimer',
      imageUrl:
          'https://movies.universalpictures.com/media/opr-tsr1sheet3-look2-rgb-3-1-1-64545c0d15f1e-1.jpg',
      overall: 100,
      time: '1h 32m',
      createdAt: DateTime.now(),
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text(
                "myLibrary".tr(),
                style: TextStyle(
                  color: const Color(0xffEEEFF0),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "SfProDisplay",
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              CategorySwitcherWidget(
                categoryEntities: categories,
                onTap: (String categoryId) {},
              ),
              SizedBox(
                height: 32.h,
              ),
              ...List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20).r,
                  child: MovieCardWidget(movieEntity: entity),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "libraryDescription".tr(),
                style: TextStyle(
                  color: const Color(0xFFB9BFC1),
                  fontSize: 14.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
