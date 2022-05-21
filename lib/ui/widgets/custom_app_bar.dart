import 'package:cycle_store/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, this.title = "", this.actions = const []})
      : super(key: key);

  final String title;
  final List<Map> actions;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 40,
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Icon(
                Icons.chevron_left_outlined,
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(PRIMARY_TEXT_COLOR),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
                  foregroundColor: MaterialStateProperty.all(Colors.black)),
            )),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Row(
          children: actions
              .map(
                (action) => SizedBox(
                    width: 40,
                    child: TextButton(
                      onPressed: action["onPressed"],
                      child: Icon(
                        action["icon"],
                        size: 28,
                      ),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(SECONDARY_TEXT_COLOR)),
                    )),
              )
              .toList(),
        )
      ],
    );
  }
}
