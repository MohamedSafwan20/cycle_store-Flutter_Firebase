import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {Key? key,
      required this.text,
      this.height = 50,
      this.width = double.infinity,
      this.borderRadius = 8,
      required this.onPressed,
      this.icon,
      this.textStyle = const TextStyle()})
      : super(key: key);

  final String text;
  final double height;
  final double width;
  final double borderRadius;
  final Function() onPressed;
  final TextStyle textStyle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: textStyle.copyWith(color: Colors.black, fontSize: 14),
              ),
              icon != null
                  ? Icon(
                      icon,
                      size: 18,
                      color: Colors.black,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          )),
        ),
      ),
    );
  }
}
