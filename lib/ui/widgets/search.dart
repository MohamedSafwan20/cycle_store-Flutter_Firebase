import 'package:cycle_store/config/colors.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search your bike here...",
            fillColor: Colors.white,
            filled: true,
            suffixIcon: Container(
              margin: const EdgeInsets.only(right: 10, top: 4, bottom: 4),
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  color: PRIMARY_COLOR, borderRadius: BorderRadius.circular(5)),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10))),
      ),
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: SHADOW_COLOR, offset: Offset(1, 4), blurRadius: 5),
      ]),
    );
  }
}
