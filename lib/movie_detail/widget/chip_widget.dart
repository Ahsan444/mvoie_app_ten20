import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';

class ChipWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  const ChipWidget({Key? key,this.text,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text ?? 'Action',
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          )),
      backgroundColor: color ?? Constants.COLOR6,
    );
  }
}
