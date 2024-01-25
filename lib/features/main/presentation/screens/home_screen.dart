import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/core/widgets/category_switcher_widget.dart';
import 'package:movie_zone/core/widgets/loading_widget.dart';
import 'package:movie_zone/features/main/domain/entities/category_entity.dart';
import 'package:movie_zone/features/main/presentation/cubit/movies/movies_cubit.dart';
import 'package:movie_zone/features/main/presentation/cubit/popular_movies/popular_movies_cubit.dart';
import 'package:movie_zone/features/main/presentation/cubit/tv_series/tv_series_cubit.dart';

import 'package:movie_zone/features/main/presentation/widgets/tv_view_widget.dart';

import '../../../../core/api/api_constants.dart';
import '../widgets/scroll_panel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryEntity> categories = const [
    CategoryEntity(
      title: "All",
      categoryId: '',
    ),
    CategoryEntity(
      title: "TV Series",
      categoryId: '',
    ),
    CategoryEntity(
      title: "Actions",
      categoryId: '',
    ),
    CategoryEntity(
      title: "Asian",
      categoryId: '',
    ),
  ];
  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize() {
    BlocProvider.of<MoviesCubit>(context).load();
    BlocProvider.of<PopularMoviesCubit>(context).load();
    BlocProvider.of<TvSeriesCubit>(context).load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<MoviesCubit, MoviesState>(
                builder: (context, state) {
                  if (state is MoviesLoaded) {
                    final movies = state.movieEntity.movies;
                    final len = movies.length;
                    final movie = movies[Random().nextInt(len)];
                    return Container(
                      height: 468.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "${ApiConstants.imageApiUrl}${movie.imageUrl}",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
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
                        child: SafeArea(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20).r,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 24.h,
                                ),
                                CategorySwitcherWidget(
                                    categoryEntities: categories,
                                    onTap: (String categoryId) {}),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return const LoadingWidget(size: 100);
                },
              ),
              SizedBox(
                height: 32.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
                      builder: (context, state) {
                        if (state is PopularMoviesLoaded) {
                          return ScrollPanelWidget(
                            title: 'popularMovies'.tr(),
                            movieEntities: state.movies.movies,
                          );
                        }
                        return const LoadingWidget(size: 100);
                      },
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    BlocBuilder<TvSeriesCubit, TvSeriesState>(
                      builder: (context, state) {
                        if (state is TvSeriesLoaded) {
                          final movie = state.movies.series;
                          return TvViewWidget(
                              title: 'tvSeries'.tr(), tvEntity: movie);
                        }
                        return const LoadingWidget(size: 100);
                      },
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    // Text(
                    //   "brands".tr(),
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 24.sp,
                    //     fontWeight: FontWeight.w700,
                    //     fontFamily: "SfProDisplay",
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    // SizedBox(
                    //   height: 82.h,
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     shrinkWrap: true,
                    //     itemCount: 5,
                    //     itemBuilder: (context, index) => Padding(
                    //       padding: const EdgeInsets.only(right: 12).r,
                    //       child: BrandWidget(
                    //         imageUrl:
                    //             "https://i.pinimg.com/564x/6e/44/d8/6e44d8091bbce3113a6b5ea1af6b7bff.jpg",
                    //         onTap: (p0) {
                    //           AnimatedNavigation.push(
                    //             context: context,
                    //             page: const BrandScreen(
                    //               logoUrl:
                    //                   "https://i.pinimg.com/564x/6e/44/d8/6e44d8091bbce3113a6b5ea1af6b7bff.jpg",
                    //             ),
                    //           );
                    //         },
                    //         fullLogoUrl:
                    //             "https://i.pinimg.com/564x/6e/44/d8/6e44d8091bbce3113a6b5ea1af6b7bff.jpg",
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 32.h,
                    // ),
                    // ScrollPanelWidget(
                    //   title: 'sport'.tr(),
                    //   movieEntities: const [],
                    // ),
                    // SizedBox(
                    //   height: 110.h,
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
