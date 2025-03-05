import 'package:flutter/material.dart';
import 'package:real_estate_app/decorations/app_colors.dart';
import 'package:real_estate_app/decorations/app_textstyles.dart';
import 'package:real_estate_app/src/shared_widget/app_svg_widget.dart';

class AppMarkerWidget extends StatefulWidget {
  final String text;
  final bool noLayer;
  const AppMarkerWidget({super.key, required this.text, this.noLayer = false});

  @override
  State<AppMarkerWidget> createState() => _AppMarkerWidgetState();
}

class _AppMarkerWidgetState extends State<AppMarkerWidget> {
  double _width = 0;
  double _height = 0;
  bool _showText = false;

  @override
  void initState() {
    super.initState();
    _animateMarker();
  }

  void _animateMarker() {
    Future.delayed(Duration(milliseconds: 2000), () {
      if (mounted) {
        setState(() {
          _width = 68;
          _height = 42;
        });
      }

      Future.delayed(Duration(milliseconds: 400), () {
        if (mounted) {
          setState(() {
            _showText = true;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: widget.noLayer ? 42 : _width,
            height: _height,
            decoration: BoxDecoration(
              color: AppColors.orangeColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(12),
              ),
            ),
            curve: Curves.easeInOut,
            child: Center(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 800),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child:
                    widget.noLayer
                        ? AppSvgWidget(
                          'buiding_icon',
                          key: ValueKey("icon"),
                          color: Colors.white,
                        )
                        : AnimatedOpacity(
                          opacity: _showText ? 1 : 0,
                          duration: Duration(seconds: 1),
                          child: Text(
                            widget.text,
                            key: ValueKey("text"),
                            style: AppTextStyles.body(
                              context,
                              color: Colors.white,
                            ),
                          ),
                        ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
