import 'package:flutter/material.dart';
import 'package:real_estate_app/decorations/app_colors.dart';
import 'package:real_estate_app/src/features/home/home_screen.dart';
import 'package:real_estate_app/src/features/search/search_screen.dart';
import 'package:real_estate_app/src/shared_widget/app_bottom_navigator.dart';
import 'package:real_estate_app/src/shared_widget/smooth_opacity_wrapper.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double _bottomPosition = -1000;
  final pageController = PageController(initialPage: 1);
  AnimationController? _searchPageAnimationControlller;
  AnimationController? _homePageAnimationCotnroller;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1200), () {
      setState(() {
        _bottomPosition = 34;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.009, 0.8594],
            colors: [AppColors.lightOrange, AppColors.primaryColor],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                SmoothOpacityWrapper(
                  child: SearchScreen(),
                  onInitialize: (controller) {
                    _searchPageAnimationControlller = controller;
                  },
                ),
                SmoothOpacityWrapper(
                  child: HomeScreen(),
                  onInitialize: (controller) {
                    _homePageAnimationCotnroller = controller;
                  },
                ),
              ],
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 3800),
              bottom: _bottomPosition,
              child: AppBottomNavigatorBar(
                onChange: (index) {
                  if (_searchPageAnimationControlller != null) {
                    _searchPageAnimationControlller!.reset();
                    _searchPageAnimationControlller!.forward();
                  }
                  if (_homePageAnimationCotnroller != null) {
                    _homePageAnimationCotnroller!.reset();
                    _homePageAnimationCotnroller!.forward();
                  }
                  pageController.jumpToPage(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
