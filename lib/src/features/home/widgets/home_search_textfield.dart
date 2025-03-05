import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:real_estate_app/decorations/app_colors.dart';
import 'package:real_estate_app/decorations/app_textstyles.dart';
import 'package:real_estate_app/src/shared_widget/app_svg_widget.dart';

class HomeSearchTextField extends StatefulWidget {
  const HomeSearchTextField({super.key});

  @override
  createState() => _HomeSearchTextFieldState();
}

class _HomeSearchTextFieldState extends State<HomeSearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(seconds: 3),
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.easeOutExpo,
      builder: (context, value, child) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 45,
            width: 145 * value,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.white,
            ),
            child: ClipRect(
              child: Opacity(
                opacity: value > 0.8 ? (value - 0.8) * 5 : 0,
                child: FittedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppSvgWidget("location_icon"),
                      Gap(4),
                      Text(
                        "Saint Petersburg",
                        style: AppTextStyles.body(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          context,
                          color: AppColors.darkOrange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
