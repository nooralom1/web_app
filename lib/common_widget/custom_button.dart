import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? borderColor;
  final Color? bgColor;
  final Color? textColor;
  final double? borderRadius;
  final void Function()? onTap;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.borderColor = Colors.blue,
    this.bgColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(width: 1.w, color: borderColor!),
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Center(
            child: Text(text, style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
