import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:real_estate_app/decorations/app_colors.dart';
import 'package:real_estate_app/decorations/app_textstyles.dart';
import 'package:real_estate_app/src/shared_widget/app_svg_widget.dart';
import 'package:real_estate_app/src/shared_widget/ease_in_widget.dart';

class AnimatedMenu extends StatefulWidget {
  final bool showMenu;
  final Function(int) onClosed;
  final int currentIndex;
  const AnimatedMenu({
    super.key,
    required this.showMenu,
    required this.onClosed,
    required this.currentIndex,
  });

  @override
  State<AnimatedMenu> createState() => _AnimatedMenuState();
}

class _AnimatedMenuState extends State<AnimatedMenu> {
  @override
  Widget build(BuildContext context) {
    return EaseInWidget(
      useWithEffect: false,
      isExpanded: widget.showMenu,
      duration: const Duration(milliseconds: 300),
      direction: Offset(-0.8, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 148,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.lighgtGrey,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(4),
                MenuItem(
                  currentIndex: widget.currentIndex,
                  index: 0,
                  onTap: widget.onClosed,
                  name: "Cosy areas",
                  asset: 'security_check_icon',
                ),
                Gap(20),
                MenuItem(
                  currentIndex: widget.currentIndex,
                  index: 1,
                  name: "Price",
                  onTap: widget.onClosed,
                  asset: "wallet_icon",
                ),
                Gap(20),
                MenuItem(
                  currentIndex: widget.currentIndex,
                  index: 2,
                  onTap: widget.onClosed,
                  name: "Infrastructure",
                  asset: "bag_icon",
                ),
                Gap(20),
                MenuItem(
                  currentIndex: widget.currentIndex,
                  index: 3,
                  onTap: widget.onClosed,
                  name: "Without any layer",
                  asset: "stack_icon",
                ),
                Gap(4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String name;
  final String asset;
  final Function(int) onTap;
  final int index;
  final int currentIndex;
  const MenuItem({
    super.key,
    required this.name,
    required this.asset,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(index),
      child: Row(
        children: [
          AppSvgWidget(
            asset,
            size: 16,
            color:
                currentIndex == index
                    ? AppColors.orangeColor
                    : AppColors.headerTextColor.withValues(alpha: 0.7),
          ),
          Gap(8),
          Expanded(
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.body(
                context,
                fontWeight: FontWeight.w400,
                color:
                    currentIndex == index
                        ? AppColors.orangeColor
                        : AppColors.headerTextColor.withValues(alpha: 0.7),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
