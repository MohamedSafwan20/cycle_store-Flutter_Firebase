import 'package:cycle_store/config/colors.dart';
import 'package:flutter/material.dart';

class PrimaryIconButton extends StatelessWidget {
  const PrimaryIconButton({
    Key? key,
    required this.icon,
    this.height = 50,
    this.width = 100,
    this.borderRadius = 2,
    required this.onPressed,
    this.size = 25,
  }) : super(key: key);

  final IconData icon;
  final double height;
  final double width;
  final double borderRadius;
  final Function() onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        child: Icon(
          icon,
          size: size,
        ),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(PRIMARY_COLOR),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)))),
      ),
    );
  }
}
