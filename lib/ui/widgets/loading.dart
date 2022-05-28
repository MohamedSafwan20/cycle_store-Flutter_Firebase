import 'package:cycle_store/config/colors.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading(
      {Key? key, this.height = 28, this.width = 28, this.color = PRIMARY_COLOR})
      : super(key: key);

  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: SizedBox(
            height: height,
            width: width,
            child: CircularProgressIndicator(
              color: color,
            )));
  }
}
