import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:real_estate_app/decorations/app_colors.dart';
import 'package:real_estate_app/decorations/app_textstyles.dart';
import 'package:real_estate_app/helpers/extensions.dart';

class HomeSingleProductItem extends StatefulWidget {
  final double width;
  final String asset;
  final String text;
  const HomeSingleProductItem({
    super.key,
    required this.width,
    required this.asset,
    required this.text,
  });

  @override
  State<HomeSingleProductItem> createState() => _HomeSingleProductItemState();
}

class _HomeSingleProductItemState extends State<HomeSingleProductItem> {
  double _width = 0;
  double _height = 0;
  bool showText = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _width = 48;
        _height = 48;
        setState(() {});
      });
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          _width = widget.width;
          setState(() {});
        });
        Future.delayed(Duration(milliseconds: 500), () {
          setState(() {
            showText = true;
            setState(() {});
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/images/${widget.asset}.png"),
        Positioned(
          right: 6,
          left: 6,
          bottom: 12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: _width,
                margin: EdgeInsets.symmetric(horizontal: 12),

                height: _height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.white.withValues(alpha: 0.49),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: FittedBox(
                          child: Row(
                            children: [
                              AnimatedOpacity(
                                opacity: showText ? 1 : 0,
                                duration: const Duration(milliseconds: 500),
                                child: Text(
                                  showText ? widget.text : "",
                                  style: AppTextStyles.header(
                                    context,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                              AnimatedContainer(
                                width:
                                    !showText
                                        ? 0
                                        : (_width *
                                            (_width > (context.deviceWidth / 2)
                                                ? 0.3
                                                : 0.08)),
                                duration: const Duration(milliseconds: 800),
                              ),
                              Image.asset("assets/images/slider_icon.png"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
