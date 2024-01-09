import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/features/auth/presentation/screens/on_boarding_screen.dart';
import 'package:movie_zone/get_it/locator.dart';

import '../features/auth/presentation/cubit/auth_cubit.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late AuthCubit authCubit;

  @override
  void initState() {
    authCubit = locator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => authCubit),
          ],
          child: MaterialApp(
            theme: ThemeData(
              appBarTheme:
                  const AppBarTheme(backgroundColor: Colors.transparent),
              scaffoldBackgroundColor: const Color(0xff101111),
            ),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: child,
          ),
        );
      },
      child: const OnBoardingScreen(),
    );
  }
}
