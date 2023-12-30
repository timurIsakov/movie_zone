import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_zone/features/main/domain/entities/category_entity.dart';

class SwitcherCategoriesWidget extends StatefulWidget {
  final List<CategoryEntity> listOfCategory;
  final Function(String categoryId) onTap;
  const SwitcherCategoriesWidget(
      {Key? key, required this.listOfCategory, required this.onTap})
      : super(key: key);

  @override
  State<SwitcherCategoriesWidget> createState() =>
      _SwitcherCategoriesWidgetState();
}

class _SwitcherCategoriesWidgetState extends State<SwitcherCategoriesWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          ...List.generate(
            widget.listOfCategory.length,
            (index) {
              final element = widget.listOfCategory[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                  widget.onTap.call(element.categoryId);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 4).r,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36).r,
                        color: currentIndex == index
                            ? const Color(0xffEEEFF0)
                            : Colors.transparent),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8)
                          .r,
                      child: Text(
                        element.title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: "SfProDisplay",
                          color: currentIndex == index
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
