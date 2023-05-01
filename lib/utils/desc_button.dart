// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescButton extends StatelessWidget {
  final IconData icon;
  final String str;
  const DescButton({super.key, required this.icon, required this.str});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 70,
      width: 70,
      child: Column(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Color.fromRGBO(61, 61, 61, 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            str,
            style: GoogleFonts.workSans(
              fontSize: 14,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
