import 'package:cycle_store/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  const Loading(
      {Key? key,
      this.height = 28,
      this.width = 28,
      this.color = PRIMARY_COLOR,
      this.loader = LoadingAnimationWidget.threeArchedCircle})
      : super(key: key);

  final double height;
  final double width;
  final Color color;
  final Widget Function({required Color color, Key? key, required double size})
      loader;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: SizedBox(
            height: height,
            width: width,
            child: loader(color: color, size: height)));
  }
}
