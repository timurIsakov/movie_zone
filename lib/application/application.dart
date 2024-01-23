import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/features/auth/presentation/screens/on_boarding_screen.dart';
import 'package:movie_zone/features/main/presentation/cubit/movies/movies_cubit.dart';
import 'package:movie_zone/features/main/presentation/cubit/profile/profile_cubit.dart';
import 'package:movie_zone/get_it/locator.dart';

import '../core/services/secure_storage_service.dart';
import '../core/services/storage_keys.dart';
import '../features/auth/presentation/cubit/auth/auth_cubit.dart';
import '../features/auth/presentation/cubit/session/session_cubit.dart';
import '../features/main/presentation/screens/main_screen.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late AuthCubit authCubit;
  late SessionCubit sessionCubit;
  late SecureStorageService secureStorageService;
  late ProfileCubit profileCubit;
  late MoviesCubit moviesCubit;

  @override
  void initState() {
    authCubit = locator();
    sessionCubit = locator();
    secureStorageService = locator();
    profileCubit = locator();
    moviesCubit = locator();
    initialize();
    super.initState();
  }

  initialize() async {
    await secureStorageService.save(
      key: StorageKeys.token,
      value:
          "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNjhiYjdlNjcxZGI5MDk4YzkyODIwNzI2YzFlMzNmMyIsInN1YiI6IjY1OTI5OTU5NjUxZmNmNWYxMzhlYjg3MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pdqI_L93K4mexvxfX3KxhY43wEH6bCybCYHhuR1PaOw",
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: authCubit),
        BlocProvider.value(value: sessionCubit..checkSession()),
        BlocProvider.value(value: profileCubit),
        BlocProvider.value(value: moviesCubit),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: BlocBuilder<SessionCubit, SessionState>(
          builder: (context, state) {
            if (state is SessionActive) {
              return const MainScreen();
            } else if (state is SessionDisabled) {
              return const OnBoardingScreen();
            }

            return const Center(
              child: RefreshProgressIndicator(),
            );
          },
        ),
        builder: (context, child) {
          return MaterialApp(
            title: 'Movie Zone',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeData(
              scaffoldBackgroundColor: const Color(0xff0F1111),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: child,
          );
        },
      ),
    );
  }
}
