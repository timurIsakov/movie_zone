import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/main/domain/entities/category_entity.dart';

class CategorySwitcherWidget extends StatefulWidget {
  final List<CategoryEntity> categoryEntities;
  final Function(String categoryId) onTap;
  const CategorySwitcherWidget(
      {Key? key, required this.categoryEntities, required this.onTap})
      : super(key: key);

  @override
  State<CategorySwitcherWidget> createState() => _CategorySwitcherWidgetState();
}

class _CategorySwitcherWidgetState extends State<CategorySwitcherWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            widget.categoryEntities.length,
            (index) {
              final element = widget.categoryEntities[index];
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
                      color: currentIndex == index
                          ? const Color(0xffEEEFF0)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(36).r,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8)
                          .r,
                      child: Text(
                        element.title,
                        style: TextStyle(
                          color: currentIndex == index
                              ? const Color(0xff191B1C)
                              : const Color(0xffEEEFF0),
                          fontFamily: "SfProDisplay",
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
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
