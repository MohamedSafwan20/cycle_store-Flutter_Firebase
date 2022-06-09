import 'package:cycle_store/utils/utils.dart';
import 'package:flutter/material.dart';

class NameAvatar extends StatelessWidget {
  const NameAvatar({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    final avatarName = Utils.getAvatarName(name);

    return Container(
      alignment: Alignment.center,
      child: Text(
        avatarName,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2),
      ),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF363434)),
    );
  }
}
