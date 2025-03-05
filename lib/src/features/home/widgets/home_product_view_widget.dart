import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:real_estate_app/decorations/app_colors.dart';
import 'package:real_estate_app/decorations/app_textstyles.dart';
import 'package:real_estate_app/helpers/extensions.dart';
import 'package:real_estate_app/src/features/home/widgets/home_single_product_item.dart';
import 'package:real_estate_app/src/shared_widget/animated_number_counting_widget.dart';
import 'package:real_estate_app/src/shared_widget/ease_in_widget.dart';

class HomeProductViewWidget extends StatefulWidget {
  const HomeProductViewWidget({super.key});

  @override
  createState() => _HomeProductViewWidgetState();
}

class _HomeProductViewWidgetState extends State<HomeProductViewWidget> {
  double _topPosition = 1000;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1800), () {
      setState(() {
        _topPosition = -context.deviceWidth * 0.49;
      });
      Future.delayed(Duration(milliseconds: 4000), () {
        setState(() {
          _topPosition = 0;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(12),
              Row(
                children: [
                  Expanded(
                    child: EaseInWidget(
                      delayDuration: Duration(milliseconds: 1500),
                      child: Container(
                        height: context.deviceWidth * 0.4,
                        width: context.deviceWidth * 0.4,
                        decoration: BoxDecoration(
                          color: AppColors.orangeColor,
                          shape: BoxShape.circle,
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Column(
                            children: [
                              Text(
                                "Buy",
                                style: AppTextStyles.body(
                                  context,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Gap(context.deviceWidth * 0.02),
                              AnimatedNumberCountingWidget(
                                value: "1000",
                                textStyle: AppTextStyles.body(
                                  context,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 32,
                                ),
                              ),

                              Gap(context.deviceWidth * 0.02),
                              Text(
                                "Offers",
                                style: AppTextStyles.body(
                                  context,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(12),
                  Expanded(
                    child: EaseInWidget(
                      delayDuration: Duration(milliseconds: 1500),
                      child: Container(
                        height: context.deviceWidth * 0.4,
                        width: context.deviceWidth * 0.4,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Column(
                            children: [
                              Text(
                                "Rent",
                                style: AppTextStyles.body(
                                  context,
                                  color: AppColors.darkOrange,
                                  fontSize: 16,
                                ),
                              ),
                              Gap(context.deviceWidth * 0.02),
                              AnimatedNumberCountingWidget(
                                value: "2212",
                                textStyle: AppTextStyles.body(
                                  context,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.darkOrange,
                                  fontSize: 32,
                                ),
                              ),
                              Gap(context.deviceWidth * 0.02),
                              Text(
                                "Offers",
                                style: AppTextStyles.body(
                                  context,
                                  color: AppColors.darkOrange,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            top: _topPosition,
            bottom: 0,
            right: -20,
            left: -20,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Gap(context.deviceWidth * 0.49),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        HomeSingleProductItem(
                          asset: "product_1",
                          text: "Gubina St., 11",
                          width: context.deviceWidth * 0.9,
                        ),

                        Gap(8),
                        Row(
                          children: [
                            Expanded(
                              child: HomeSingleProductItem(
                                asset: "product_2",
                                text: "Gubina St., 11",
                                width: context.deviceWidth * 0.37,
                              ),
                            ),
                            Gap(8),
                            Expanded(
                              child: Column(
                                children: [
                                  HomeSingleProductItem(
                                    text: "Trefeleva St., 43",
                                    asset: "product_3",
                                    width: context.deviceWidth * 0.37,
                                  ),
                                  Gap(8),
                                  HomeSingleProductItem(
                                    text: "Sedova St. 22",
                                    asset: "product_3",
                                    width: context.deviceWidth * 0.37,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
