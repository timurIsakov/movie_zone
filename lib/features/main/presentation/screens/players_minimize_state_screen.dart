import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayersMinimizeStateScreen extends StatefulWidget {
  const PlayersMinimizeStateScreen({Key? key}) : super(key: key);

  @override
  State<PlayersMinimizeStateScreen> createState() =>
      _PlayersMinimizeStateScreenState();
}

class _PlayersMinimizeStateScreenState
    extends State<PlayersMinimizeStateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 254.h,
          width: MediaQuery.of(context).size.width.w,
        )
      ]),
    );
  }
}
