import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_zone/core/utils/assets.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  const LoadingWidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(Assets.tMovieLoading, height: size),
    );
  }
}
