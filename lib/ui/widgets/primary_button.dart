import 'package:cycle_store/config/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.text,
      this.height = 30,
      this.width = 100,
      this.borderRadius = 2,
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
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(color: PRIMARY_COLOR, offset: Offset(1, 1), blurRadius: 6),
      ], borderRadius: BorderRadius.circular(borderRadius)),
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(PRIMARY_COLOR),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          )),
          shadowColor: MaterialStateProperty.all(PRIMARY_COLOR),
        ),
      ),
    );
  }
}
