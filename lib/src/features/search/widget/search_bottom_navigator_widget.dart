import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:real_estate_app/decorations/app_colors.dart';
import 'package:real_estate_app/decorations/app_textstyles.dart';
import 'package:real_estate_app/src/shared_widget/animated_menu_widget.dart';
import 'package:real_estate_app/src/shared_widget/app_svg_widget.dart';
import 'package:real_estate_app/src/shared_widget/ease_in_widget.dart';

class SearchBottomNavigatorWidget extends StatefulWidget {
  final Function(bool) onMarkerChanged;
  const SearchBottomNavigatorWidget({super.key, required this.onMarkerChanged});

  @override
  State<SearchBottomNavigatorWidget> createState() =>
      _SearchBottomNavigatorWidgetState();
}

class _SearchBottomNavigatorWidgetState
    extends State<SearchBottomNavigatorWidget> {
  bool showMenu = false;

  int currentMenuIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  EaseInWidget(
                    delayDuration: const Duration(milliseconds: 2000),
                    child: NavigatorItemWidget(
                      asset: showMenu ? "wallet_icon" : "navigation_icon",
                      onTap: () {
                        showMenu = true;
                        setState(() {});
                      },
                    ),
                  ),

                  AnimatedMenu(
                    showMenu: showMenu,
                    currentIndex: currentMenuIndex,
                    onClosed: (menuIndex) {
                      currentMenuIndex = menuIndex;
                      showMenu = false;
                      setState(() {});
                      if (menuIndex == 3) {
                        widget.onMarkerChanged(true);
                        return;
                      }
                      widget.onMarkerChanged(false);
                    },
                  ),
                ],
              ),
              Gap(20),
              EaseInWidget(
                delayDuration: const Duration(milliseconds: 2000),
                child: NavigatorItemWidget(asset: "stack_icon", onTap: () {}),
              ),
            ],
          ),
        ),
        Spacer(),
        EaseInWidget(
          delayDuration: const Duration(milliseconds: 2000),
          isRounded: false,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.colorGrey.withValues(alpha: 0.5),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                AppSvgWidget('menu_icon', size: 14),
                Gap(4),
                Text(
                  "List of variants",
                  style: AppTextStyles.body(
                    context,
                    color: AppColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NavigatorItemWidget extends StatelessWidget {
  final String asset;
  final Function onTap;
  const NavigatorItemWidget({
    super.key,
    required this.asset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white.withValues(alpha: 0.3),
        highlightColor: Colors.white,
        splashFactory: InkRipple.splashFactory,
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.all(12),
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.colorGrey.withValues(alpha: 0.5),
          ),
          child: AppSvgWidget(asset, color: AppColors.white),
        ),
      ),
    );
  }
}
