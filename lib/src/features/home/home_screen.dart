import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:real_estate_app/helpers/extensions.dart';
import 'package:real_estate_app/src/features/home/widgets/home_product_view_widget.dart';
import 'package:real_estate_app/src/features/home/widgets/home_search_textfield.dart';
import 'package:real_estate_app/src/shared_widget/ease_in_widget.dart';
import 'package:real_estate_app/src/shared_widget/fade_in_text_widget.dart';
import 'package:real_estate_app/src/shared_widget/slide_up_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: context.deviceHeight,
        width: context.deviceHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(24),
            Row(
              children: [
                HomeSearchTextField(),
                Spacer(),
                EaseInWidget(
                  child: Image.asset(
                    "assets/images/avatar_img.png",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Gap(context.deviceHeight * 0.04),
            FadeInText(text: "Hi, Marina"),
            Gap(4),
            SlideUpText(text: "Let’s select your\nperfect place"),
            HomeProductViewWidget(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
