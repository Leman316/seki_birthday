import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../consts/consts.dart';

class CreditDialog extends StatelessWidget {
  const CreditDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("D2A65A"),
      height: AppSizes.newSize(16),
      width: AppSizes.newSize(34),
      child: Container(
          padding: const EdgeInsets.all(3),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: HexColor("E0D6EA"),
            border: Border.all(color: HexColor("D2A65A"), width: 4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            children: [
              DialogRow("Coding/Dev", "Leman"),
              DialogRow("Dialog Finding", "Pay"),
              DialogRow("Menu Background", "Nor"),
            ],
          )),
    );
  }
}

class DialogRow extends StatelessWidget {
  const DialogRow(this.title, this.author, {super.key});
  final String title, author;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: AppSizes.size14,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            author,
            style: TextStyle(
              fontSize: AppSizes.size15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
