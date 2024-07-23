// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ThreeDotLoader extends StatefulWidget {
  final Color color;
  final double size;

  const ThreeDotLoader(
      {super.key, this.color = const Color(0xFF03213A), this.size = 50.0});

  @override
  // ignore: library_private_types_in_public_api
  _ThreeDotLoaderState createState() => _ThreeDotLoaderState();
}

class _ThreeDotLoaderState extends State<ThreeDotLoader>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildDot(int index, double radius) {
    return Opacity(
      opacity:
          (1.0 - (animation.value - index / widget.size).abs()).clamp(0.0, 1.0),
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double dotSize = widget.size / 5;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildDot(0, dotSize),
        SizedBox(width: dotSize),
        buildDot(1, dotSize),
        SizedBox(width: dotSize),
        buildDot(2, dotSize),
      ],
    );
  }
}
