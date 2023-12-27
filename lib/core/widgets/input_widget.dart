import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputWidget extends StatelessWidget {
  final String text;
  final Function(String)? validator;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  const InputWidget(
      {Key? key,
      required this.text,
      this.validator,
      this.onChanged,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {
        onChanged?.call(value);
      },
      validator: (value) {
        return validator?.call(value!);
      },
      style: TextStyle(
        color: const Color(0xff747E83),
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        fontFamily: "SfProDisplay",
      ),
      cursorColor: const Color(0xff747E83),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ).r,
        filled: true,
        fillColor: const Color(0xff191B1C),
        hintText: text,
        hintStyle: TextStyle(
          color: const Color(0xff747E83),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "SfProDisplay",
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff656E72)),
          borderRadius: BorderRadius.circular(8).r,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8).r,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff656E72)),
          borderRadius: BorderRadius.circular(8).r,
        ),
      ),
    );
  }
}
