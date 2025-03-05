import 'package:flutter/material.dart';
import 'package:real_estate_app/decorations/app_textstyles.dart';

class SlideUpText extends StatefulWidget {
  final String text;
  const SlideUpText({super.key, required this.text});

  @override
  createState() => _SlideUpTextState();
}

class _SlideUpTextState extends State<SlideUpText> {
  final double paddingTop = 100;
  bool _animate = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        _animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 700),
      curve: Curves.easeOut,
      height: 110,
      padding: EdgeInsets.only(top: _animate ? 0 : 100),

      child: Text(
        widget.text,
        style: AppTextStyles.header(
          context,
          fontSize: 32,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
