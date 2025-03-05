import 'package:flutter/material.dart';

class EaseInWidget extends StatefulWidget {
  final Widget child;
  final Duration? delayDuration;
  final bool isRounded;
  final Offset direction;
  final Duration duration;
  final bool isExpanded;
  final bool useWithEffect;

  const EaseInWidget({
    super.key,
    required this.child,
    this.delayDuration,
    this.isRounded = true,
    this.useWithEffect = true,
    this.direction = const Offset(0, 0),
    this.duration = const Duration(seconds: 2),
    this.isExpanded = true,
  });

  @override
  State<EaseInWidget> createState() => _EaseInWidgetState();
}

class _EaseInWidgetState extends State<EaseInWidget> {
  bool _startAnimation = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(widget.delayDuration ?? Duration(seconds: 0), () {
      setState(() {
        _startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _startAnimation
        ? TweenAnimationBuilder<double>(
          duration: widget.duration,
          tween: Tween<double>(begin: 0, end: widget.isExpanded ? 1 : 0),
          curve: widget.useWithEffect ? Curves.easeOutBack : Curves.linear,
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(
                widget.direction.dx * (1 - value) * 100,
                widget.direction.dy * (1 - value) * 100,
              ),
              child: Transform.scale(
                scale: value,
                child:
                    widget.isRounded
                        ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: widget.child,
                        )
                        : widget.child,
              ),
            );
          },
        )
        : SizedBox();
  }
}
