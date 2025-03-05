import 'package:flutter/material.dart';

class AnimatedNumberCountingWidget extends StatefulWidget {
  final String value;
  final Duration? duration;
  final TextStyle textStyle;

  const AnimatedNumberCountingWidget({
    super.key,
    required this.value,
    required this.textStyle,
    this.duration,
  });

  @override
  createState() => _AnimatedNumberCountingWidget();
}

class _AnimatedNumberCountingWidget
    extends State<AnimatedNumberCountingWidget> {
  late int counter;

  @override
  void initState() {
    super.initState();
    counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      duration: widget.duration ?? Duration(milliseconds: 1000),
      tween: IntTween(begin: 0, end: int.parse(widget.value)),
      onEnd: () {},
      builder: (context, value, child) {
        return Text(value.toString(), style: widget.textStyle);
      },
    );
  }
}
