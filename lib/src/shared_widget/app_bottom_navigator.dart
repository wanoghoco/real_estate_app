import 'package:flutter/material.dart';
import 'package:real_estate_app/decorations/app_colors.dart';
import 'package:real_estate_app/helpers/extensions.dart';
import 'package:real_estate_app/src/shared_widget/app_svg_widget.dart';

class AppBottomNavigatorBar extends StatefulWidget {
  final Function(int) onChange;
  const AppBottomNavigatorBar({super.key, required this.onChange});

  @override
  State<AppBottomNavigatorBar> createState() => _AppBottomNavigatorBarState();
}

class _AppBottomNavigatorBarState extends State<AppBottomNavigatorBar> {
  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: EdgeInsets.symmetric(horizontal: 4),
      width: context.deviceWidth * 0.8,
      decoration: BoxDecoration(
        color: AppColors.colorBlack,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NavMenuItem(
            asset: 'search_menu_icon',
            currentIndex: currentIndex,
            index: 0,
            onTap: (index) {
              if (currentIndex == 0) {
                return;
              }
              currentIndex = 0;
              widget.onChange(0);
              setState(() {});
            },
          ),
          NavMenuItem(
            asset: 'message_menu_icon',
            currentIndex: currentIndex,
            index: 1,
            onTap: (index) {},
          ),
          CenterNavItem(
            currentIndex: currentIndex,
            index: 2,
            onTap: (index) {
              if (currentIndex == 2) {
                return;
              }
              currentIndex = 2;
              widget.onChange(1);
              setState(() {});
            },
          ),
          NavMenuItem(
            asset: 'heart_menu_icon',
            currentIndex: currentIndex,
            index: 3,
            onTap: (index) {},
          ),
          NavMenuItem(
            asset: 'profile_menu_icon',
            currentIndex: currentIndex,
            index: 4,
            onTap: (index) {},
          ),
        ],
      ),
    );
  }
}

class CenterNavItem extends StatefulWidget {
  final Function(int) onTap;
  final int index;
  final int currentIndex;
  const CenterNavItem({
    super.key,

    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CenterNavItem> createState() => _CenterNavItemState();
}

class _CenterNavItemState extends State<CenterNavItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => widget.onTap(widget.index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          margin: EdgeInsets.symmetric(horizontal: 4),
          height: 56,
          width: 56,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                widget.currentIndex == widget.index
                    ? AppColors.orangeColor
                    : AppColors.colorDark,
          ),
          child: AppSvgWidget('home_menu_icon'),
        ),
      ),
    );
  }
}

class NavMenuItem extends StatefulWidget {
  final String asset;
  final Function(int) onTap;
  final int index;
  final int currentIndex;
  const NavMenuItem({
    super.key,
    required this.asset,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<NavMenuItem> createState() => _NavMenuItemState();
}

class _NavMenuItemState extends State<NavMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => widget.onTap(widget.index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          margin: EdgeInsets.symmetric(horizontal: 4),
          height: 44,
          width: 44,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                widget.currentIndex == widget.index
                    ? AppColors.orangeColor
                    : AppColors.colorDark,
          ),
          child: AppSvgWidget(widget.asset),
        ),
      ),
    );
  }
}
