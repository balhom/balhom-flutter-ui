import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticsChartTitleContainer extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Widget? button;

  const StatisticsChartTitleContainer(
      {super.key,
      required this.backgroundColor,
      required this.text,
      this.button});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: Colors.black),
      ),
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
                child: Text(text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold))),
          ),
          if (button != null) button!
        ],
      ),
    );
  }
}
