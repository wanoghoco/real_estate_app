import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgWidget extends StatelessWidget {
  final String assetName;
  final double? size;
  final Color? color;

  const AppSvgWidget(this.assetName, {super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/svgs/$assetName.svg",
      // color:  color,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      height: size,
      width: size,
    );
  }
}
