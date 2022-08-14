import 'package:cycle_store/config/colors.dart';
import 'package:flutter/material.dart';

class SizeChartModal extends StatelessWidget {
  const SizeChartModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
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
                0: FixedColumnWidth(80),
                1: FixedColumnWidth(70),
                2: FixedColumnWidth(70),
                3: FixedColumnWidth(80),
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
                      "10-14\ninch",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "16-20\ninch",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "24-26+\ninch",
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
                      "1.5-4\nyears",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "5-8\nyears",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "9-13+\nyears",
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
                      "29-46\ncm",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "44-56\ncm",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "57-71+\ncm",
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
