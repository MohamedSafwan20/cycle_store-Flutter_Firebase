import 'package:cycle_store/config/colors.dart';
import 'package:flutter/material.dart';

class PrimaryGhostButton extends StatelessWidget {
  const PrimaryGhostButton(
      {Key? key,
      required this.text,
      this.height = 50,
      this.width = double.infinity,
      this.borderRadius = 5,
      required this.onPressed,
      this.textStyle = const TextStyle()})
      : super(key: key);

  final String text;
  final double height;
  final double width;
  final double borderRadius;
  final Function() onPressed;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle.copyWith(color: PRIMARY_COLOR, fontSize: 12),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(PRIMARY_TEXT_COLOR),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          )),
        ),
      ),
    );
  }
}
