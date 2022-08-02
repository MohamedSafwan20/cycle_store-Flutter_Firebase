import 'package:cycle_store/config/colors.dart';
import 'package:flutter/material.dart';

class SizeChartModal extends StatelessWidget {
  const SizeChartModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: SHADOW_COLOR,
          thickness: 0.85,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
          child: Table(
            border: TableBorder.all(
              color: SECONDARY_TEXT_COLOR,
            ),
            columnWidths: const {
              0: FixedColumnWidth(115),
              1: FixedColumnWidth(45),
              2: FixedColumnWidth(45),
              3: FixedColumnWidth(45),
            },
            children: [
              TableRow(children: [
                Container(
                  color: SECONDARY_COLOR,
                  padding: const EdgeInsets.all(12.0),
                  child: const Text(
                    "Wheel Size",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "20",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "20",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "20",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]),
              TableRow(children: [
                Container(
                  color: SECONDARY_COLOR,
                  padding: const EdgeInsets.all(12.0),
                  child: const Text(
                    "Approx. Age",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "20",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "20",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "20",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]),
              TableRow(children: [
                Container(
                  color: SECONDARY_COLOR,
                  padding: const EdgeInsets.all(12.0),
                  child: const Text(
                    "Rider Height",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "20",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "20",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "20",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ]),
            ],
          ),
        )
      ],
    );
  }
}
