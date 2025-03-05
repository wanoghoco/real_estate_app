import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:real_estate_app/decorations/app_colors.dart';
import 'package:real_estate_app/src/shared_widget/app_svg_widget.dart';
import 'package:real_estate_app/src/shared_widget/ease_in_widget.dart';

class SearchTopWidget extends StatelessWidget {
  const SearchTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: EaseInWidget(
              delayDuration: const Duration(milliseconds: 2000),
              isRounded: false,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 49,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    AppSvgWidget('search_icon'),
                    Gap(12),
                    Text("Saint Petersburg"),
                  ],
                ),
              ),
            ),
          ),
          Gap(20),
          SizedBox(
            height: 48,
            width: 48,
            child: EaseInWidget(
              delayDuration: const Duration(milliseconds: 2000),

              child: Container(
                padding: EdgeInsets.all(14),
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: AppSvgWidget('filter_icon'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
