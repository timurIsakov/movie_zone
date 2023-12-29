import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/utils/assets.dart';
import 'package:movie_zone/features/main/domain/entities/movie_entity.dart';

import '../features/main/presentation/screens/movie_details_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xff101111),
          ),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: child,
        );
      },
      child: MovieDetailsScreen(
        movieEntity: MovieEntity(
          title: "Oppenheimer",
          post: Assets.tOppenheimerPost,
          description:
              "\"Oppenheimer\" is a biographical film that chronicles the life of J. Robert Oppenheimer, a brilliant physicist who was instrumental in developing the atomic bomb during World War II. This film explores Oppenheim",
          trailerURL: "",
          trailerDuration: "1m 45s",
          createdAt: DateTime.now(),
        ),
      ),
    );
  }
}
