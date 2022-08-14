import 'package:cycle_store/config/colors.dart';
import 'package:flutter/material.dart';

class SizeChartModal extends StatelessWidget {
  const SizeChartModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 10,
      child: Column(
        children: [
          const Divider(
            color: SHADOW_COLOR,
            thickness: 0.85,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Table(
              border: TableBorder.all(
                color: SECONDARY_TEXT_COLOR,
              ),
              columnWidths: const {
                0: FixedColumnWidth(77),
                1: FixedColumnWidth(65),
                2: FixedColumnWidth(65),
                3: FixedColumnWidth(75),
              },
              children: [
                TableRow(children: [
                  Container(
                    color: SECONDARY_COLOR,
                    padding: const EdgeInsets.all(12.0),
                    child: const Text(
                      "Wheel \nSize",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "10-\n14",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "16-\n20",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "24-\n26+",
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
                      "1.5-4\nyrs",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "5-8\nyrs",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "9-13+\nyrs",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Container(
                    color: SECONDARY_COLOR,
                    padding: const EdgeInsets.all(12.0),
                    child: const Text(
                      "Inseam\n(cm)",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "29-\n46",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "44-\n56",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "57-\n71+",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
