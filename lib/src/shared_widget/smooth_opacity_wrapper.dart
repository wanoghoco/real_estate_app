import 'package:flutter/material.dart';

class SmoothOpacityWrapper extends StatefulWidget {
  final Widget child;
  final Function(AnimationController) onInitialize;
  const SmoothOpacityWrapper({
    super.key,
    required this.child,
    required this.onInitialize,
  });

  @override
  createState() => _SmoothOpacityWrapperState();
}

class _SmoothOpacityWrapperState extends State<SmoothOpacityWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
    widget.onInitialize(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _opacityAnimation, child: widget.child);
  }
}
