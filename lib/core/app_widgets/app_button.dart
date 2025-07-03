import 'package:flutter/material.dart';
import 'package:practices/core/app_theme/app_colors.dart';

class AppButton extends StatelessWidget {
  String? text;
  Color? bgColor;
  bool? isborder;
  VoidCallback? onTap;
  double? marginHorizontal;
  AppButton({
    super.key,
    this.text,
    this.bgColor,
    this.isborder,
    this.onTap,
    this.marginHorizontal,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: marginHorizontal ?? 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: isborder == true
              ? Colors.transparent
              : bgColor ?? AppColors.primary,
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: isborder == true ? AppColors.primary : Colors.white,
          ),
        ),
      ),
    );
  }
}
